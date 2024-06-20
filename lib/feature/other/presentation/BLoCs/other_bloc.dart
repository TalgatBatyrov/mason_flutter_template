import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/other/domain/interactors/other_interactor.dart';

part 'other_bloc.freezed.dart';
part 'other_event.dart';
part 'other_state.dart';

@injectable
class OtherBloc extends Bloc<OtherEvent, OtherState> {
  final OtherInteractor _otherInteractor;
  OtherBloc(this._otherInteractor) : super(const OtherState.initial()) {
    on<OtherEvent>(_onEvent);
  }
  _onEvent(
    OtherEvent events,
    Emitter<OtherState> emit,
  ) {
    return events.map(
      fetchData: (v) => onFetchData(v, emit),
    );
  }

  onFetchData(
    // ignore: library_private_types_in_public_api
    _FetchDataEvent event,
    Emitter<OtherState> emit,
  ) async {
    emit(const OtherState.loading());
    try {
      final response = await _otherInteractor.getOther();
      emit(OtherState.success(data: response));
    } catch (e) {
      emit(OtherState.error(message: e.toString()));
    }
  }
}
