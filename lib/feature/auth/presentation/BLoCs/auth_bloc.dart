import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/auth/domain/interactors/auth_interactor.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthInteractor _authInteractor;
  AuthBloc(this._authInteractor) : super(const AuthState.initial()) {
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
    try {
      final response = await _authInteractor.getAuth();
      emit(AuthState.success(data: response));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }
}
