// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recognition_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecognitionTaskModel _$RecognitionTaskModelFromJson(Map<String, dynamic> json) {
  return _RecognitionTaskModel.fromJson(json);
}

/// @nodoc
mixin _$RecognitionTaskModel {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<Datum> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecognitionTaskModelCopyWith<RecognitionTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecognitionTaskModelCopyWith<$Res> {
  factory $RecognitionTaskModelCopyWith(RecognitionTaskModel value,
          $Res Function(RecognitionTaskModel) then) =
      _$RecognitionTaskModelCopyWithImpl<$Res, RecognitionTaskModel>;
  @useResult
  $Res call({int id, int userId, String name, String type, List<Datum> data});
}

/// @nodoc
class _$RecognitionTaskModelCopyWithImpl<$Res,
        $Val extends RecognitionTaskModel>
    implements $RecognitionTaskModelCopyWith<$Res> {
  _$RecognitionTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? type = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecognitionTaskModelImplCopyWith<$Res>
    implements $RecognitionTaskModelCopyWith<$Res> {
  factory _$$RecognitionTaskModelImplCopyWith(_$RecognitionTaskModelImpl value,
          $Res Function(_$RecognitionTaskModelImpl) then) =
      __$$RecognitionTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int userId, String name, String type, List<Datum> data});
}

/// @nodoc
class __$$RecognitionTaskModelImplCopyWithImpl<$Res>
    extends _$RecognitionTaskModelCopyWithImpl<$Res, _$RecognitionTaskModelImpl>
    implements _$$RecognitionTaskModelImplCopyWith<$Res> {
  __$$RecognitionTaskModelImplCopyWithImpl(_$RecognitionTaskModelImpl _value,
      $Res Function(_$RecognitionTaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? type = null,
    Object? data = null,
  }) {
    return _then(_$RecognitionTaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecognitionTaskModelImpl implements _RecognitionTaskModel {
  const _$RecognitionTaskModelImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.type,
      required final List<Datum> data})
      : _data = data;

  factory _$RecognitionTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecognitionTaskModelImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String name;
  @override
  final String type;
  final List<Datum> _data;
  @override
  List<Datum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RecognitionTaskModel(id: $id, userId: $userId, name: $name, type: $type, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecognitionTaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, type,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecognitionTaskModelImplCopyWith<_$RecognitionTaskModelImpl>
      get copyWith =>
          __$$RecognitionTaskModelImplCopyWithImpl<_$RecognitionTaskModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecognitionTaskModelImplToJson(
      this,
    );
  }
}

abstract class _RecognitionTaskModel implements RecognitionTaskModel {
  const factory _RecognitionTaskModel(
      {required final int id,
      required final int userId,
      required final String name,
      required final String type,
      required final List<Datum> data}) = _$RecognitionTaskModelImpl;

  factory _RecognitionTaskModel.fromJson(Map<String, dynamic> json) =
      _$RecognitionTaskModelImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get name;
  @override
  String get type;
  @override
  List<Datum> get data;
  @override
  @JsonKey(ignore: true)
  _$$RecognitionTaskModelImplCopyWith<_$RecognitionTaskModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int get id => throw _privateConstructorUsedError;
  int get recognitionId => throw _privateConstructorUsedError;
  String get displayed => throw _privateConstructorUsedError;
  String get hidden => throw _privateConstructorUsedError;
  int get delay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {int id, int recognitionId, String displayed, String hidden, int delay});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recognitionId = null,
    Object? displayed = null,
    Object? hidden = null,
    Object? delay = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recognitionId: null == recognitionId
          ? _value.recognitionId
          : recognitionId // ignore: cast_nullable_to_non_nullable
              as int,
      displayed: null == displayed
          ? _value.displayed
          : displayed // ignore: cast_nullable_to_non_nullable
              as String,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as String,
      delay: null == delay
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int recognitionId, String displayed, String hidden, int delay});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recognitionId = null,
    Object? displayed = null,
    Object? hidden = null,
    Object? delay = null,
  }) {
    return _then(_$DatumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recognitionId: null == recognitionId
          ? _value.recognitionId
          : recognitionId // ignore: cast_nullable_to_non_nullable
              as int,
      displayed: null == displayed
          ? _value.displayed
          : displayed // ignore: cast_nullable_to_non_nullable
              as String,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as String,
      delay: null == delay
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {required this.id,
      required this.recognitionId,
      required this.displayed,
      required this.hidden,
      required this.delay});

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  final int id;
  @override
  final int recognitionId;
  @override
  final String displayed;
  @override
  final String hidden;
  @override
  final int delay;

  @override
  String toString() {
    return 'Datum(id: $id, recognitionId: $recognitionId, displayed: $displayed, hidden: $hidden, delay: $delay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recognitionId, recognitionId) ||
                other.recognitionId == recognitionId) &&
            (identical(other.displayed, displayed) ||
                other.displayed == displayed) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.delay, delay) || other.delay == delay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, recognitionId, displayed, hidden, delay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {required final int id,
      required final int recognitionId,
      required final String displayed,
      required final String hidden,
      required final int delay}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  int get id;
  @override
  int get recognitionId;
  @override
  String get displayed;
  @override
  String get hidden;
  @override
  int get delay;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
