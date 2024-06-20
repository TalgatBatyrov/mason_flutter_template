
import 'package:freezed_annotation/freezed_annotation.dart';

part 'piramida_model.freezed.dart';
part 'piramida_model.g.dart';

@freezed
class PiramidaModel with _$PiramidaModel {
  const factory PiramidaModel({
    required int id,
    required String title,
  }) = _PiramidaModel;

  factory PiramidaModel.fromJson(Map<String, dynamic> json) =>
      _$PiramidaModelFromJson(json);
}