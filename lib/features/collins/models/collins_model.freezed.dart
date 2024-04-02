// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collins_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollinsModel _$CollinsModelFromJson(Map<String, dynamic> json) {
  return _CollinsModel.fromJson(json);
}

/// @nodoc
mixin _$CollinsModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get instructionText => throw _privateConstructorUsedError;
  List<Datum> get data => throw _privateConstructorUsedError;
  int get interStimuliDelay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollinsModelCopyWith<CollinsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollinsModelCopyWith<$Res> {
  factory $CollinsModelCopyWith(
          CollinsModel value, $Res Function(CollinsModel) then) =
      _$CollinsModelCopyWithImpl<$Res, CollinsModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int userId,
      DateTime createdAt,
      String instructionText,
      List<Datum> data,
      int interStimuliDelay});
}

/// @nodoc
class _$CollinsModelCopyWithImpl<$Res, $Val extends CollinsModel>
    implements $CollinsModelCopyWith<$Res> {
  _$CollinsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? instructionText = null,
    Object? data = null,
    Object? interStimuliDelay = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      instructionText: null == instructionText
          ? _value.instructionText
          : instructionText // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      interStimuliDelay: null == interStimuliDelay
          ? _value.interStimuliDelay
          : interStimuliDelay // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollinsModelImplCopyWith<$Res>
    implements $CollinsModelCopyWith<$Res> {
  factory _$$CollinsModelImplCopyWith(
          _$CollinsModelImpl value, $Res Function(_$CollinsModelImpl) then) =
      __$$CollinsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int userId,
      DateTime createdAt,
      String instructionText,
      List<Datum> data,
      int interStimuliDelay});
}

/// @nodoc
class __$$CollinsModelImplCopyWithImpl<$Res>
    extends _$CollinsModelCopyWithImpl<$Res, _$CollinsModelImpl>
    implements _$$CollinsModelImplCopyWith<$Res> {
  __$$CollinsModelImplCopyWithImpl(
      _$CollinsModelImpl _value, $Res Function(_$CollinsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? instructionText = null,
    Object? data = null,
    Object? interStimuliDelay = null,
  }) {
    return _then(_$CollinsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      instructionText: null == instructionText
          ? _value.instructionText
          : instructionText // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      interStimuliDelay: null == interStimuliDelay
          ? _value.interStimuliDelay
          : interStimuliDelay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollinsModelImpl implements _CollinsModel {
  const _$CollinsModelImpl(
      {required this.id,
      required this.name,
      required this.userId,
      required this.createdAt,
      required this.instructionText,
      required final List<Datum> data,
      required this.interStimuliDelay})
      : _data = data;

  factory _$CollinsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollinsModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int userId;
  @override
  final DateTime createdAt;
  @override
  final String instructionText;
  final List<Datum> _data;
  @override
  List<Datum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int interStimuliDelay;

  @override
  String toString() {
    return 'CollinsModel(id: $id, name: $name, userId: $userId, createdAt: $createdAt, instructionText: $instructionText, data: $data, interStimuliDelay: $interStimuliDelay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollinsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.instructionText, instructionText) ||
                other.instructionText == instructionText) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.interStimuliDelay, interStimuliDelay) ||
                other.interStimuliDelay == interStimuliDelay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      userId,
      createdAt,
      instructionText,
      const DeepCollectionEquality().hash(_data),
      interStimuliDelay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollinsModelImplCopyWith<_$CollinsModelImpl> get copyWith =>
      __$$CollinsModelImplCopyWithImpl<_$CollinsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollinsModelImplToJson(
      this,
    );
  }
}

abstract class _CollinsModel implements CollinsModel {
  const factory _CollinsModel(
      {required final int id,
      required final String name,
      required final int userId,
      required final DateTime createdAt,
      required final String instructionText,
      required final List<Datum> data,
      required final int interStimuliDelay}) = _$CollinsModelImpl;

  factory _CollinsModel.fromJson(Map<String, dynamic> json) =
      _$CollinsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get userId;
  @override
  DateTime get createdAt;
  @override
  String get instructionText;
  @override
  List<Datum> get data;
  @override
  int get interStimuliDelay;
  @override
  @JsonKey(ignore: true)
  _$$CollinsModelImplCopyWith<_$CollinsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int get id => throw _privateConstructorUsedError;
  int get collinId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get correct => throw _privateConstructorUsedError;
  String get wrong => throw _privateConstructorUsedError;

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
      {int id, int collinId, String question, String correct, String wrong});
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
    Object? collinId = null,
    Object? question = null,
    Object? correct = null,
    Object? wrong = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collinId: null == collinId
          ? _value.collinId
          : collinId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      wrong: null == wrong
          ? _value.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as String,
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
      {int id, int collinId, String question, String correct, String wrong});
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
    Object? collinId = null,
    Object? question = null,
    Object? correct = null,
    Object? wrong = null,
  }) {
    return _then(_$DatumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collinId: null == collinId
          ? _value.collinId
          : collinId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      wrong: null == wrong
          ? _value.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {required this.id,
      required this.collinId,
      required this.question,
      required this.correct,
      required this.wrong});

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  final int id;
  @override
  final int collinId;
  @override
  final String question;
  @override
  final String correct;
  @override
  final String wrong;

  @override
  String toString() {
    return 'Datum(id: $id, collinId: $collinId, question: $question, correct: $correct, wrong: $wrong)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collinId, collinId) ||
                other.collinId == collinId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, collinId, question, correct, wrong);

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
      required final int collinId,
      required final String question,
      required final String correct,
      required final String wrong}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  int get id;
  @override
  int get collinId;
  @override
  String get question;
  @override
  String get correct;
  @override
  String get wrong;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
