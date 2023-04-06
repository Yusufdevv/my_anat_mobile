import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'most_populars_bloc.freezed.dart';
part 'most_populars_event.dart';
part 'most_populars_state.dart';

class MostPopularsBloc extends Bloc<MostPopularsEvent, MostPopularsState> {
  MostPopularsBloc() : super(MostPopularsState()) {
    on<MostPopularsEvent>((event, emit) {});
  }
}
