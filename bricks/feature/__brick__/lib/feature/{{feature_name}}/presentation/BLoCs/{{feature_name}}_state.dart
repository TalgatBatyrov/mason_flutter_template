part of '{{feature_name}}_bloc.dart';

@freezed
class {{feature_name.pascalCase()}}State with _${{feature_name.pascalCase()}}State  {
  const factory {{feature_name.pascalCase()}}State.initial() = _Initial;
  const factory {{feature_name.pascalCase()}}State.loading() = _Loading;
  const factory {{feature_name.pascalCase()}}State.success({required String data}) = _Data;
  const factory {{feature_name.pascalCase()}}State.error({required String message}) = _Error;
}