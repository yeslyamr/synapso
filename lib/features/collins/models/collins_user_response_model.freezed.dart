// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collins_user_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollinsUserResponseModel _$CollinsUserResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CollinsUserResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CollinsUserResponseModel {
  int get experimentId => throw _privateConstructorUsedError;
  int get collinDataId => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;
  int get timeToComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollinsUserResponseModelCopyWith<CollinsUserResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollinsUserResponseModelCopyWith<$Res> {
  factory $CollinsUserResponseModelCopyWith(CollinsUserResponseModel value,
          $Res Function(CollinsUserResponseModel) then) =
      _$CollinsUserResponseModelCopyWithImpl<$Res, CollinsUserResponseModel>;
  @useResult
  $Res call(
      {int experimentId,
      int collinDataId,
      String response,
      int timeToComplete});
}

/// @nodoc
class _$CollinsUserResponseModelCopyWithImpl<$Res,
        $Val extends CollinsUserResponseModel>
    implements $CollinsUserResponseModelCopyWith<$Res> {
  _$CollinsUserResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentId = null,
    Object? collinDataId = null,
    Object? response = null,
    Object? timeToComplete = null,
  }) {
    return _then(_value.copyWith(
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      collinDataId: null == collinDataId
          ? _value.collinDataId
          : collinDataId // ignore: cast_nullable_to_non_nullable
              as int,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      timeToComplete: null == timeToComplete
          ? _value.timeToComplete
          : timeToComplete // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollinsUserResponseModelImplCopyWith<$Res>
    implements $CollinsUserResponseModelCopyWith<$Res> {
  factory _$$CollinsUserResponseModelImplCopyWith(
          _$CollinsUserResponseModelImpl value,
          $Res Function(_$CollinsUserResponseModelImpl) then) =
      __$$CollinsUserResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int experimentId,
      int collinDataId,
      String response,
      int timeToComplete});
}

/// @nodoc
class __$$CollinsUserResponseModelImplCopyWithImpl<$Res>
    extends _$CollinsUserResponseModelCopyWithImpl<$Res,
        _$CollinsUserResponseModelImpl>
    implements _$$CollinsUserResponseModelImplCopyWith<$Res> {
  __$$CollinsUserResponseModelImplCopyWithImpl(
      _$CollinsUserResponseModelImpl _value,
      $Res Function(_$CollinsUserResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentId = null,
    Object? collinDataId = null,
    Object? response = null,
    Object? timeToComplete = null,
  }) {
    return _then(_$CollinsUserResponseModelImpl(
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      collinDataId: null == collinDataId
          ? _value.collinDataId
          : collinDataId // ignore: cast_nullable_to_non_nullable
              as int,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      timeToComplete: null == timeToComplete
          ? _value.timeToComplete
          : timeToComplete // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollinsUserResponseModelImpl implements _CollinsUserResponseModel {
  const _$CollinsUserResponseModelImpl(
      {required this.experimentId,
      required this.collinDataId,
      required this.response,
      required this.timeToComplete});

  factory _$CollinsUserResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollinsUserResponseModelImplFromJson(json);

  @override
  final int experimentId;
  @override
  final int collinDataId;
  @override
  final String response;
  @override
  final int timeToComplete;

  @override
  String toString() {
    return 'CollinsUserResponseModel(experimentId: $experimentId, collinDataId: $collinDataId, response: $response, timeToComplete: $timeToComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollinsUserResponseModelImpl &&
            (identical(other.experimentId, experimentId) ||
                other.experimentId == experimentId) &&
            (identical(other.collinDataId, collinDataId) ||
                other.collinDataId == collinDataId) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.timeToComplete, timeToComplete) ||
                other.timeToComplete == timeToComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, experimentId, collinDataId, response, timeToComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollinsUserResponseModelImplCopyWith<_$CollinsUserResponseModelImpl>
      get copyWith => __$$CollinsUserResponseModelImplCopyWithImpl<
          _$CollinsUserResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollinsUserResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CollinsUserResponseModel implements CollinsUserResponseModel {
  const factory _CollinsUserResponseModel(
      {required final int experimentId,
      required final int collinDataId,
      required final String response,
      required final int timeToComplete}) = _$CollinsUserResponseModelImpl;

  factory _CollinsUserResponseModel.fromJson(Map<String, dynamic> json) =
      _$CollinsUserResponseModelImpl.fromJson;

  @override
  int get experimentId;
  @override
  int get collinDataId;
  @override
  String get response;
  @override
  int get timeToComplete;
  @override
  @JsonKey(ignore: true)
  _$$CollinsUserResponseModelImplCopyWith<_$CollinsUserResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
