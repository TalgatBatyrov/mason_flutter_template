import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'parts/on_fetch_data.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(const HomeState.initial()) {
    on<HomeEvent>(_onEvent);
  }
  _onEvent(
    HomeEvent events,
    Emitter<HomeState> emit,
  ) {
    return events.map(
      fetchData: _$onFetchData,
    );
  }
}
