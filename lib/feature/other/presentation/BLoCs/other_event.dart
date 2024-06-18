part of 'other_bloc.dart';

@freezed
class OtherEvent with _$OtherEvent {
  const factory OtherEvent.fetchData() = _FetchDataEvent;
}