// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiments_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExperimentsModel _$ExperimentsModelFromJson(Map<String, dynamic> json) {
  return _ExperimentsModel.fromJson(json);
}

/// @nodoc
mixin _$ExperimentsModel {
  List<RecallTaskModel>? get recall => throw _privateConstructorUsedError;
  List<RecognitionTaskModel>? get recognition =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperimentsModelCopyWith<ExperimentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperimentsModelCopyWith<$Res> {
  factory $ExperimentsModelCopyWith(
          ExperimentsModel value, $Res Function(ExperimentsModel) then) =
      _$ExperimentsModelCopyWithImpl<$Res, ExperimentsModel>;
  @useResult
  $Res call(
      {List<RecallTaskModel>? recall, List<RecognitionTaskModel>? recognition});
}

/// @nodoc
class _$ExperimentsModelCopyWithImpl<$Res, $Val extends ExperimentsModel>
    implements $ExperimentsModelCopyWith<$Res> {
  _$ExperimentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recall = freezed,
    Object? recognition = freezed,
  }) {
    return _then(_value.copyWith(
      recall: freezed == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as List<RecallTaskModel>?,
      recognition: freezed == recognition
          ? _value.recognition
          : recognition // ignore: cast_nullable_to_non_nullable
              as List<RecognitionTaskModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperimentsModelImplCopyWith<$Res>
    implements $ExperimentsModelCopyWith<$Res> {
  factory _$$ExperimentsModelImplCopyWith(_$ExperimentsModelImpl value,
          $Res Function(_$ExperimentsModelImpl) then) =
      __$$ExperimentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RecallTaskModel>? recall, List<RecognitionTaskModel>? recognition});
}

/// @nodoc
class __$$ExperimentsModelImplCopyWithImpl<$Res>
    extends _$ExperimentsModelCopyWithImpl<$Res, _$ExperimentsModelImpl>
    implements _$$ExperimentsModelImplCopyWith<$Res> {
  __$$ExperimentsModelImplCopyWithImpl(_$ExperimentsModelImpl _value,
      $Res Function(_$ExperimentsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recall = freezed,
    Object? recognition = freezed,
  }) {
    return _then(_$ExperimentsModelImpl(
      recall: freezed == recall
          ? _value._recall
          : recall // ignore: cast_nullable_to_non_nullable
              as List<RecallTaskModel>?,
      recognition: freezed == recognition
          ? _value._recognition
          : recognition // ignore: cast_nullable_to_non_nullable
              as List<RecognitionTaskModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperimentsModelImpl implements _ExperimentsModel {
  const _$ExperimentsModelImpl(
      {required final List<RecallTaskModel>? recall,
      required final List<RecognitionTaskModel>? recognition})
      : _recall = recall,
        _recognition = recognition;

  factory _$ExperimentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperimentsModelImplFromJson(json);

  final List<RecallTaskModel>? _recall;
  @override
  List<RecallTaskModel>? get recall {
    final value = _recall;
    if (value == null) return null;
    if (_recall is EqualUnmodifiableListView) return _recall;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RecognitionTaskModel>? _recognition;
  @override
  List<RecognitionTaskModel>? get recognition {
    final value = _recognition;
    if (value == null) return null;
    if (_recognition is EqualUnmodifiableListView) return _recognition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExperimentsModel(recall: $recall, recognition: $recognition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperimentsModelImpl &&
            const DeepCollectionEquality().equals(other._recall, _recall) &&
            const DeepCollectionEquality()
                .equals(other._recognition, _recognition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recall),
      const DeepCollectionEquality().hash(_recognition));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperimentsModelImplCopyWith<_$ExperimentsModelImpl> get copyWith =>
      __$$ExperimentsModelImplCopyWithImpl<_$ExperimentsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperimentsModelImplToJson(
      this,
    );
  }
}

abstract class _ExperimentsModel implements ExperimentsModel {
  const factory _ExperimentsModel(
          {required final List<RecallTaskModel>? recall,
          required final List<RecognitionTaskModel>? recognition}) =
      _$ExperimentsModelImpl;

  factory _ExperimentsModel.fromJson(Map<String, dynamic> json) =
      _$ExperimentsModelImpl.fromJson;

  @override
  List<RecallTaskModel>? get recall;
  @override
  List<RecognitionTaskModel>? get recognition;
  @override
  @JsonKey(ignore: true)
  _$$ExperimentsModelImplCopyWith<_$ExperimentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
