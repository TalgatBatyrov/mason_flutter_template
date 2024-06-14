part of 'lola_bloc.dart';

@freezed
class LolaEvent with _$LolaEvent {
  const factory LolaEvent.fetchData() = _FetchDataEvent;
}