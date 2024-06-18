import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/domain/interactors/home_interactor.dart';


part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
   final HomeInteractor _homeInteractor;
  HomeBloc(this._homeInteractor) : super(const HomeState.initial()) {
    on<HomeEvent>(_onEvent);
  }
    _onEvent(
      HomeEvent events,
      Emitter<HomeState> emit,
    ) {
      return events.map(
        fetchData: (v) => onFetchData(v, emit),
      );
    }
  
  onFetchData(
    _FetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      final response = await _homeInteractor.getHome();
      emit(HomeState.success(data: response));
    } catch (e) {
      emit(HomeState.error(message: e.toString()));
    }
  }
}
