import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/profile/domain/interactors/profile_interactor.dart';


part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
   final ProfileInteractor _profileInteractor;
  ProfileBloc(this._profileInteractor) : super(const ProfileState.initial()) {
    on<ProfileEvent>(_onEvent);
  }
    _onEvent(
      ProfileEvent events,
      Emitter<ProfileState> emit,
    ) {
      return events.map(
        fetchData: (v) => onFetchData(v, emit),
      );
    }
  
  onFetchData(
    _FetchDataEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      final response = await _profileInteractor.getProfile();
      emit(ProfileState.success(data: response));
    } catch (e) {
      emit(ProfileState.error(message: e.toString()));
    }
  }
}
