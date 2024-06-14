part of '{{bloc_name}}_bloc.dart';

@freezed
class {{bloc_name.pascalCase()}}State with _${{bloc_name.pascalCase()}}State  {
  const factory {{bloc_name.pascalCase()}}State.initial() = _Initial;
  const factory {{bloc_name.pascalCase()}}State.loading() = _Loading;
  const factory {{bloc_name.pascalCase()}}State.success({required String data}) = _Success;
  const factory {{bloc_name.pascalCase()}}State.error({required String message}) = _Error;
}