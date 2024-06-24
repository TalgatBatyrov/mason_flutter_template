import 'package:freezed_annotation/freezed_annotation.dart';

part '{{repository_name}}_model.freezed.dart';
part '{{repository_name}}_model.g.dart';

@freezed
class {{repository_name.pascalCase()}}Model with _${{repository_name.pascalCase()}}Model {
  const factory {{repository_name.pascalCase()}}Model({
    required int id,
    required String title,
  }) = _{{repository_name.pascalCase()}}Model;

  factory {{repository_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{repository_name.pascalCase()}}ModelFromJson(json);
}