import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/lola/data/repositories/lola_repository.dart';

part 'make_bloc.freezed.dart';
part 'make_event.dart';
part 'make_state.dart';

@injectable
class MakeBloc extends Bloc<MakeEvent, MakeState> {
   final LolaRepository _lolaRepository;
  MakeBloc(this._lolaRepository) : super(const MakeState.initial()) {
    on<MakeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
