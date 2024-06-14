// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:test_app/feature/lola/domain/interactors/lola_interactor.dart';

// part 'lola_bloc.freezed.dart';
// part 'lola_event.dart';
// part 'lola_state.dart';

// @injectable
// class LolaBloc extends Bloc<LolaEvent, LolaState> {
//    final LolaInteractor _lolaInteractor;
//   LolaBloc(this._lolaInteractor) : super(const LolaState.initial()) {
//     on<LolaEvent>(_onEvent);
//   }
//     _onEvent(
//       LolaEvent events,
//       Emitter<LolaState> emit,
//     ) {
//       return events.map(
//         fetchData: (v) => onFetchData(v, emit),
//       );
//     }

//   onFetchData(
//     _FetchDataEvent event,
//     Emitter<LolaState> emit,
//   ) async {
//     emit(const LolaState.loading());
//     try {
//       final response = await _lolaInteractor.getLola();
//       emit(LolaState.success(data: response));
//     } catch (e) {
//       emit(LolaState.error(message: e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/lola/domain/interactors/lola_interactor.dart';

part 'musa_bloc.freezed.dart';
part 'musa_event.dart';
part 'musa_state.dart';

@injectable
class MusaBloc extends Bloc<MusaEvent, MusaState> {
  final LolaInteractor _lolaInteractor;
  MusaBloc(this._lolaInteractor) : super(const MusaState.initial()) {
    on<MusaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
