// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_experiment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyExperimentModel _$MyExperimentModelFromJson(Map<String, dynamic> json) {
  return _MyExperimentModel.fromJson(json);
}

/// @nodoc
mixin _$MyExperimentModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get experimentId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  List<String> get response => throw _privateConstructorUsedError;
  int get timeToComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyExperimentModelCopyWith<MyExperimentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyExperimentModelCopyWith<$Res> {
  factory $MyExperimentModelCopyWith(
          MyExperimentModel value, $Res Function(MyExperimentModel) then) =
      _$MyExperimentModelCopyWithImpl<$Res, MyExperimentModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      int experimentId,
      int userId,
      List<String> response,
      int timeToComplete});
}

/// @nodoc
class _$MyExperimentModelCopyWithImpl<$Res, $Val extends MyExperimentModel>
    implements $MyExperimentModelCopyWith<$Res> {
  _$MyExperimentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? experimentId = null,
    Object? userId = null,
    Object? response = null,
    Object? timeToComplete = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeToComplete: null == timeToComplete
          ? _value.timeToComplete
          : timeToComplete // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyExperimentModelImplCopyWith<$Res>
    implements $MyExperimentModelCopyWith<$Res> {
  factory _$$MyExperimentModelImplCopyWith(_$MyExperimentModelImpl value,
          $Res Function(_$MyExperimentModelImpl) then) =
      __$$MyExperimentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      int experimentId,
      int userId,
      List<String> response,
      int timeToComplete});
}

/// @nodoc
class __$$MyExperimentModelImplCopyWithImpl<$Res>
    extends _$MyExperimentModelCopyWithImpl<$Res, _$MyExperimentModelImpl>
    implements _$$MyExperimentModelImplCopyWith<$Res> {
  __$$MyExperimentModelImplCopyWithImpl(_$MyExperimentModelImpl _value,
      $Res Function(_$MyExperimentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? experimentId = null,
    Object? userId = null,
    Object? response = null,
    Object? timeToComplete = null,
  }) {
    return _then(_$MyExperimentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeToComplete: null == timeToComplete
          ? _value.timeToComplete
          : timeToComplete // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyExperimentModelImpl implements _MyExperimentModel {
  const _$MyExperimentModelImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.experimentId,
      required this.userId,
      required final List<String> response,
      required this.timeToComplete})
      : _response = response;

  factory _$MyExperimentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyExperimentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final int experimentId;
  @override
  final int userId;
  final List<String> _response;
  @override
  List<String> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  final int timeToComplete;

  @override
  String toString() {
    return 'MyExperimentModel(id: $id, name: $name, type: $type, experimentId: $experimentId, userId: $userId, response: $response, timeToComplete: $timeToComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyExperimentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.experimentId, experimentId) ||
                other.experimentId == experimentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.timeToComplete, timeToComplete) ||
                other.timeToComplete == timeToComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, experimentId,
      userId, const DeepCollectionEquality().hash(_response), timeToComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyExperimentModelImplCopyWith<_$MyExperimentModelImpl> get copyWith =>
      __$$MyExperimentModelImplCopyWithImpl<_$MyExperimentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyExperimentModelImplToJson(
      this,
    );
  }
}

abstract class _MyExperimentModel implements MyExperimentModel {
  const factory _MyExperimentModel(
      {required final int id,
      required final String name,
      required final String type,
      required final int experimentId,
      required final int userId,
      required final List<String> response,
      required final int timeToComplete}) = _$MyExperimentModelImpl;

  factory _MyExperimentModel.fromJson(Map<String, dynamic> json) =
      _$MyExperimentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  int get experimentId;
  @override
  int get userId;
  @override
  List<String> get response;
  @override
  int get timeToComplete;
  @override
  @JsonKey(ignore: true)
  _$$MyExperimentModelImplCopyWith<_$MyExperimentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
