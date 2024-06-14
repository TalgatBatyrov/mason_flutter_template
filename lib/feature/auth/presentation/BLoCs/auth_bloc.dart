import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/auth/data/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
   final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);

  }
    _onEvent(
      AuthEvent events,
      Emitter<AuthState> emit,
    ) {
      return events.map(
        fetchData: (v) => onFetchData(v, emit),
      );
    }
  
   onFetchData(
      _FetchDataEvent event,
      Emitter<AuthState> emit,
    ) async {
      emit(const AuthState.loading());
      final response = await _authRepository.getAuth();
      response.fold(
        (l) => emit(AuthState.error(message: l.toString())),
        (r) => emit(AuthState.success(data: r)),
      );
    }
}
