import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/utils/db_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc()
      : super(
          const DownloadState(
            progress: 0,
            status: FormzStatus.pure,
            fileAlreadyDownloaded: false,
            fileUrl: '',
            epubOpeningStatus: FormzStatus.pure,
          ),
        ) {
    on<ChangeProgress>((event, emit) {
      emit(state.copyWith(progress: event.progress));
    });
    on<CheckWetherFileExists>(_onCheckWetherFileExists);
    on<DownloadFinished>(_onDownloadFinished);
    progressSubscription = progressStream.listen((event) {
      add(ChangeProgress(event));
    });
  }

  Future<void> _onCheckWetherFileExists(CheckWetherFileExists event, Emitter<DownloadState> emit) async {
    if (await Permission.storage.isGranted) {
      await Permission.storage.request();
    }

    final appDocDir = Platform.isAndroid ? await getTemporaryDirectory() : await getTemporaryDirectory();

    final path = '${appDocDir.path}/${event.id}.${event.fileType}.aes';
    final file = File(path);
    final rawBooks = await DbHelper.instance.query('downloaded_journals', 'id', event.id);
    emit(state.copyWith(epubOpeningStatus: FormzStatus.submissionInProgress));
    if (!rawBooks.isNotEmpty) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      event.onNotDownloaded();
      await file.create();
      final token = StorageRepository.getString('token');
      await dio.download('/journal/${event.slug}/file/', path,
          options: Options(headers: token.isNotEmpty ? {'Authorization': "Token $token"} : {}),
          deleteOnError: true, onReceiveProgress: (receivedBytes, totalBytes) {
        streamController.add(receivedBytes / totalBytes);
        if (receivedBytes == totalBytes) {
          add(
            DownloadFinished(
              filename: event.filename,
              path: path,
              id: event.id,
            ),
          );
        }
      });
    } else {
      event.onDownloaded(path);
      emit(state.copyWith(
        fileAlreadyDownloaded: true,
        progress: 100,
        epubOpeningStatus: FormzStatus.submissionSuccess,
        fileUrl: path,
      ));
    }
  }

  Future<void> _onDownloadFinished(DownloadFinished event, Emitter<DownloadState> emit) async {
    try {
      await DbHelper.instance.insert('downloaded_journals', {
        'id': event.id,
        'title': event.filename,
        'path': event.path,
        'downloaded': 1,
      });
      emit(state.copyWith(status: FormzStatus.submissionSuccess, fileAlreadyDownloaded: true, fileUrl: event.path));
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Dio dio = serviceLocator<DioSettings>().dio;
  final StreamController<double> streamController = StreamController();
  late StreamSubscription<double> progressSubscription;

  Stream<double> get progressStream async* {
    yield* streamController.stream;
  }

  @override
  Future<void> close() async {
    await streamController.close();
    await progressSubscription.cancel();
    return await super.close();
  }
}
