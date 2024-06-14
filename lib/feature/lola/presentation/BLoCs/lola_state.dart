part of 'lola_bloc.dart';

@freezed
class LolaState with _$LolaState  {
  const factory LolaState.initial() = _Initial;
  const factory LolaState.loading() = _Loading;
  const factory LolaState.success({required String data}) = _Data;
  const factory LolaState.error({required String message}) = _Error;
}