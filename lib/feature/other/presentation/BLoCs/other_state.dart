part of 'other_bloc.dart';

@freezed
class OtherState with _$OtherState  {
  const factory OtherState.initial() = _Initial;
  const factory OtherState.loading() = _Loading;
  const factory OtherState.success({required String data}) = _Data;
  const factory OtherState.error({required String message}) = _Error;
}