// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piramida_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PiramidaModel _$PiramidaModelFromJson(Map<String, dynamic> json) {
  return _PiramidaModel.fromJson(json);
}

/// @nodoc
mixin _$PiramidaModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PiramidaModelCopyWith<PiramidaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiramidaModelCopyWith<$Res> {
  factory $PiramidaModelCopyWith(
          PiramidaModel value, $Res Function(PiramidaModel) then) =
      _$PiramidaModelCopyWithImpl<$Res, PiramidaModel>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$PiramidaModelCopyWithImpl<$Res, $Val extends PiramidaModel>
    implements $PiramidaModelCopyWith<$Res> {
  _$PiramidaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PiramidaModelImplCopyWith<$Res>
    implements $PiramidaModelCopyWith<$Res> {
  factory _$$PiramidaModelImplCopyWith(
          _$PiramidaModelImpl value, $Res Function(_$PiramidaModelImpl) then) =
      __$$PiramidaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$PiramidaModelImplCopyWithImpl<$Res>
    extends _$PiramidaModelCopyWithImpl<$Res, _$PiramidaModelImpl>
    implements _$$PiramidaModelImplCopyWith<$Res> {
  __$$PiramidaModelImplCopyWithImpl(
      _$PiramidaModelImpl _value, $Res Function(_$PiramidaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$PiramidaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PiramidaModelImpl implements _PiramidaModel {
  const _$PiramidaModelImpl({required this.id, required this.title});

  factory _$PiramidaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PiramidaModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'PiramidaModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PiramidaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PiramidaModelImplCopyWith<_$PiramidaModelImpl> get copyWith =>
      __$$PiramidaModelImplCopyWithImpl<_$PiramidaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PiramidaModelImplToJson(
      this,
    );
  }
}

abstract class _PiramidaModel implements PiramidaModel {
  const factory _PiramidaModel(
      {required final int id,
      required final String title}) = _$PiramidaModelImpl;

  factory _PiramidaModel.fromJson(Map<String, dynamic> json) =
      _$PiramidaModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$PiramidaModelImplCopyWith<_$PiramidaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
