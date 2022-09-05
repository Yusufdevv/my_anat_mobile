import 'dart:async';

import 'package:anatomica/features/hospital_single/data/models/comments.dart';
import 'package:anatomica/features/hospital_single/data/models/service.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_event.dart';

part 'services_state.dart';

part 'services_bloc.freezed.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetServicesUseCase getServices;

  ServicesBloc(this.getServices) : super(ServicesState()) {
    on<_GetServices>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress, ));
      final result = await getServices(TypeParameter(id: event.organizationId??-1, next: ''));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, services: result.right.results));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess, ));
      }
    });
  }
}
