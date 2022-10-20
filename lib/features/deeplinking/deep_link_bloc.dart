import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'deep_link_event.dart';
part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  static const dlStream = EventChannel('https.anatomica.uz/events');

  static const platform = MethodChannel('https.anatomica.uz/channel');

  final StreamController<String> _stateController = StreamController();

  Stream<String> get dlState => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  DeepLinkBloc() : super(DeepLinkInitState()) {
    print('call deeplink bloc');
    startUri().then(_onRedirected);
    dlStream.receiveBroadcastStream().listen((d) => _onRedirected(d));
    on<DeepLinkChanged>((event, emit) {
      print('deep link: ${event.uri}');
      String? parsedSlug;
      if (parsedSlug != null && parsedSlug.contains('https://anatomica.uz/')) {
        parsedSlug = event.uri.replaceAll('https://anatomica.uz/', '');
        final List<String> pathParams = parsedSlug.split('/');
        final firstParam = pathParams.first;
        final lastParam = pathParams.last;
        if (firstParam == 'doctor') {
          final doctorId = int.tryParse(lastParam);
          if (doctorId != null) {
            emit(DoctorLinkTriggered(doctorId: doctorId));
          }
        } else if (firstParam == 'organization') {
          emit(OrganizationLinkTriggered(organizationSlug: lastParam));
        } else if (firstParam == 'journal') {
          emit(JournalLinkTriggered(journalSlug: lastParam));
        }
      }
    });
  }

  void _onRedirected(String uri) {
    add(DeepLinkChanged(uri: uri));
    stateSink.add(uri);
  }

  Future<String> startUri() async {
    try {
      final link = await platform.invokeMethod('initialLink');
      print('this is link: $link');
      add(DeepLinkChanged(uri: 'this is the initial link $link'));
      return link;
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  void dispose() {
    _stateController.close();
  }
}
