// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'joke_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) {
  return _JokeModel.fromJson(json);
}

/// @nodoc
mixin _$JokeModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JokeModelCopyWith<JokeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokeModelCopyWith<$Res> {
  factory $JokeModelCopyWith(JokeModel value, $Res Function(JokeModel) then) =
      _$JokeModelCopyWithImpl<$Res, JokeModel>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$JokeModelCopyWithImpl<$Res, $Val extends JokeModel>
    implements $JokeModelCopyWith<$Res> {
  _$JokeModelCopyWithImpl(this._value, this._then);

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
abstract class _$$JokeModelImplCopyWith<$Res>
    implements $JokeModelCopyWith<$Res> {
  factory _$$JokeModelImplCopyWith(
          _$JokeModelImpl value, $Res Function(_$JokeModelImpl) then) =
      __$$JokeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$JokeModelImplCopyWithImpl<$Res>
    extends _$JokeModelCopyWithImpl<$Res, _$JokeModelImpl>
    implements _$$JokeModelImplCopyWith<$Res> {
  __$$JokeModelImplCopyWithImpl(
      _$JokeModelImpl _value, $Res Function(_$JokeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$JokeModelImpl(
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
class _$JokeModelImpl implements _JokeModel {
  const _$JokeModelImpl({required this.id, required this.title});

  factory _$JokeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JokeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'JokeModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JokeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JokeModelImplCopyWith<_$JokeModelImpl> get copyWith =>
      __$$JokeModelImplCopyWithImpl<_$JokeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JokeModelImplToJson(
      this,
    );
  }
}

abstract class _JokeModel implements JokeModel {
  const factory _JokeModel(
      {required final int id, required final String title}) = _$JokeModelImpl;

  factory _JokeModel.fromJson(Map<String, dynamic> json) =
      _$JokeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$JokeModelImplCopyWith<_$JokeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
