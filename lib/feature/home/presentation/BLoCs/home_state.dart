part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState  {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({required String data}) = _Data;
  const factory HomeState.error({required String message}) = _Error;
}