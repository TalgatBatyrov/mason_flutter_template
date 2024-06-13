part of '{{bloc_name}}_bloc.dart';

@freezed
class {{bloc_name.pascalCase()}}Event with _${{bloc_name.pascalCase()}}Event {
  const factory {{bloc_name.pascalCase()}}Event.started() = _Started;
}