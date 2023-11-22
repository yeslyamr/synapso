// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recall_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecallTaskModel _$RecallTaskModelFromJson(Map<String, dynamic> json) {
  return _RecallTaskModel.fromJson(json);
}

/// @nodoc
mixin _$RecallTaskModel {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Stimulus get stimulus => throw _privateConstructorUsedError;
  bool get isSequenceMatter => throw _privateConstructorUsedError;
  bool get isFreeRecall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecallTaskModelCopyWith<RecallTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecallTaskModelCopyWith<$Res> {
  factory $RecallTaskModelCopyWith(
          RecallTaskModel value, $Res Function(RecallTaskModel) then) =
      _$RecallTaskModelCopyWithImpl<$Res, RecallTaskModel>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String name,
      Stimulus stimulus,
      bool isSequenceMatter,
      bool isFreeRecall});

  $StimulusCopyWith<$Res> get stimulus;
}

/// @nodoc
class _$RecallTaskModelCopyWithImpl<$Res, $Val extends RecallTaskModel>
    implements $RecallTaskModelCopyWith<$Res> {
  _$RecallTaskModelCopyWithImpl(this._value, this._then);

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
    Object? stimulus = null,
    Object? isSequenceMatter = null,
    Object? isFreeRecall = null,
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
      stimulus: null == stimulus
          ? _value.stimulus
          : stimulus // ignore: cast_nullable_to_non_nullable
              as Stimulus,
      isSequenceMatter: null == isSequenceMatter
          ? _value.isSequenceMatter
          : isSequenceMatter // ignore: cast_nullable_to_non_nullable
              as bool,
      isFreeRecall: null == isFreeRecall
          ? _value.isFreeRecall
          : isFreeRecall // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StimulusCopyWith<$Res> get stimulus {
    return $StimulusCopyWith<$Res>(_value.stimulus, (value) {
      return _then(_value.copyWith(stimulus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecallTaskModelImplCopyWith<$Res>
    implements $RecallTaskModelCopyWith<$Res> {
  factory _$$RecallTaskModelImplCopyWith(_$RecallTaskModelImpl value,
          $Res Function(_$RecallTaskModelImpl) then) =
      __$$RecallTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String name,
      Stimulus stimulus,
      bool isSequenceMatter,
      bool isFreeRecall});

  @override
  $StimulusCopyWith<$Res> get stimulus;
}

/// @nodoc
class __$$RecallTaskModelImplCopyWithImpl<$Res>
    extends _$RecallTaskModelCopyWithImpl<$Res, _$RecallTaskModelImpl>
    implements _$$RecallTaskModelImplCopyWith<$Res> {
  __$$RecallTaskModelImplCopyWithImpl(
      _$RecallTaskModelImpl _value, $Res Function(_$RecallTaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? stimulus = null,
    Object? isSequenceMatter = null,
    Object? isFreeRecall = null,
  }) {
    return _then(_$RecallTaskModelImpl(
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
      stimulus: null == stimulus
          ? _value.stimulus
          : stimulus // ignore: cast_nullable_to_non_nullable
              as Stimulus,
      isSequenceMatter: null == isSequenceMatter
          ? _value.isSequenceMatter
          : isSequenceMatter // ignore: cast_nullable_to_non_nullable
              as bool,
      isFreeRecall: null == isFreeRecall
          ? _value.isFreeRecall
          : isFreeRecall // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecallTaskModelImpl implements _RecallTaskModel {
  const _$RecallTaskModelImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.stimulus,
      required this.isSequenceMatter,
      required this.isFreeRecall});

  factory _$RecallTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecallTaskModelImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String name;
  @override
  final Stimulus stimulus;
  @override
  final bool isSequenceMatter;
  @override
  final bool isFreeRecall;

  @override
  String toString() {
    return 'RecallTaskModel(id: $id, userId: $userId, name: $name, stimulus: $stimulus, isSequenceMatter: $isSequenceMatter, isFreeRecall: $isFreeRecall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecallTaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stimulus, stimulus) ||
                other.stimulus == stimulus) &&
            (identical(other.isSequenceMatter, isSequenceMatter) ||
                other.isSequenceMatter == isSequenceMatter) &&
            (identical(other.isFreeRecall, isFreeRecall) ||
                other.isFreeRecall == isFreeRecall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, name, stimulus, isSequenceMatter, isFreeRecall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecallTaskModelImplCopyWith<_$RecallTaskModelImpl> get copyWith =>
      __$$RecallTaskModelImplCopyWithImpl<_$RecallTaskModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecallTaskModelImplToJson(
      this,
    );
  }
}

abstract class _RecallTaskModel implements RecallTaskModel {
  const factory _RecallTaskModel(
      {required final int id,
      required final int userId,
      required final String name,
      required final Stimulus stimulus,
      required final bool isSequenceMatter,
      required final bool isFreeRecall}) = _$RecallTaskModelImpl;

  factory _RecallTaskModel.fromJson(Map<String, dynamic> json) =
      _$RecallTaskModelImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get name;
  @override
  Stimulus get stimulus;
  @override
  bool get isSequenceMatter;
  @override
  bool get isFreeRecall;
  @override
  @JsonKey(ignore: true)
  _$$RecallTaskModelImplCopyWith<_$RecallTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stimulus _$StimulusFromJson(Map<String, dynamic> json) {
  return _RecallTaskModelStimulus.fromJson(json);
}

/// @nodoc
mixin _$Stimulus {
  String get type => throw _privateConstructorUsedError;
  List<StimulusElement> get stimuli => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StimulusCopyWith<Stimulus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StimulusCopyWith<$Res> {
  factory $StimulusCopyWith(Stimulus value, $Res Function(Stimulus) then) =
      _$StimulusCopyWithImpl<$Res, Stimulus>;
  @useResult
  $Res call({String type, List<StimulusElement> stimuli});
}

/// @nodoc
class _$StimulusCopyWithImpl<$Res, $Val extends Stimulus>
    implements $StimulusCopyWith<$Res> {
  _$StimulusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? stimuli = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      stimuli: null == stimuli
          ? _value.stimuli
          : stimuli // ignore: cast_nullable_to_non_nullable
              as List<StimulusElement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecallTaskModelStimulusImplCopyWith<$Res>
    implements $StimulusCopyWith<$Res> {
  factory _$$RecallTaskModelStimulusImplCopyWith(
          _$RecallTaskModelStimulusImpl value,
          $Res Function(_$RecallTaskModelStimulusImpl) then) =
      __$$RecallTaskModelStimulusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<StimulusElement> stimuli});
}

/// @nodoc
class __$$RecallTaskModelStimulusImplCopyWithImpl<$Res>
    extends _$StimulusCopyWithImpl<$Res, _$RecallTaskModelStimulusImpl>
    implements _$$RecallTaskModelStimulusImplCopyWith<$Res> {
  __$$RecallTaskModelStimulusImplCopyWithImpl(
      _$RecallTaskModelStimulusImpl _value,
      $Res Function(_$RecallTaskModelStimulusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? stimuli = null,
  }) {
    return _then(_$RecallTaskModelStimulusImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      stimuli: null == stimuli
          ? _value._stimuli
          : stimuli // ignore: cast_nullable_to_non_nullable
              as List<StimulusElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecallTaskModelStimulusImpl implements _RecallTaskModelStimulus {
  const _$RecallTaskModelStimulusImpl(
      {required this.type, required final List<StimulusElement> stimuli})
      : _stimuli = stimuli;

  factory _$RecallTaskModelStimulusImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecallTaskModelStimulusImplFromJson(json);

  @override
  final String type;
  final List<StimulusElement> _stimuli;
  @override
  List<StimulusElement> get stimuli {
    if (_stimuli is EqualUnmodifiableListView) return _stimuli;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stimuli);
  }

  @override
  String toString() {
    return 'Stimulus(type: $type, stimuli: $stimuli)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecallTaskModelStimulusImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._stimuli, _stimuli));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_stimuli));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecallTaskModelStimulusImplCopyWith<_$RecallTaskModelStimulusImpl>
      get copyWith => __$$RecallTaskModelStimulusImplCopyWithImpl<
          _$RecallTaskModelStimulusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecallTaskModelStimulusImplToJson(
      this,
    );
  }
}

abstract class _RecallTaskModelStimulus implements Stimulus {
  const factory _RecallTaskModelStimulus(
          {required final String type,
          required final List<StimulusElement> stimuli}) =
      _$RecallTaskModelStimulusImpl;

  factory _RecallTaskModelStimulus.fromJson(Map<String, dynamic> json) =
      _$RecallTaskModelStimulusImpl.fromJson;

  @override
  String get type;
  @override
  List<StimulusElement> get stimuli;
  @override
  @JsonKey(ignore: true)
  _$$RecallTaskModelStimulusImplCopyWith<_$RecallTaskModelStimulusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StimulusElement _$StimulusElementFromJson(Map<String, dynamic> json) {
  return _StimulusElement.fromJson(json);
}

/// @nodoc
mixin _$StimulusElement {
  int get id => throw _privateConstructorUsedError;
  int get recallId => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  int get delay => throw _privateConstructorUsedError;
  String? get cue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StimulusElementCopyWith<StimulusElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StimulusElementCopyWith<$Res> {
  factory $StimulusElementCopyWith(
          StimulusElement value, $Res Function(StimulusElement) then) =
      _$StimulusElementCopyWithImpl<$Res, StimulusElement>;
  @useResult
  $Res call({int id, int recallId, String data, int delay, String? cue});
}

/// @nodoc
class _$StimulusElementCopyWithImpl<$Res, $Val extends StimulusElement>
    implements $StimulusElementCopyWith<$Res> {
  _$StimulusElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recallId = null,
    Object? data = null,
    Object? delay = null,
    Object? cue = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recallId: null == recallId
          ? _value.recallId
          : recallId // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      delay: null == delay
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as int,
      cue: freezed == cue
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StimulusElementImplCopyWith<$Res>
    implements $StimulusElementCopyWith<$Res> {
  factory _$$StimulusElementImplCopyWith(_$StimulusElementImpl value,
          $Res Function(_$StimulusElementImpl) then) =
      __$$StimulusElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int recallId, String data, int delay, String? cue});
}

/// @nodoc
class __$$StimulusElementImplCopyWithImpl<$Res>
    extends _$StimulusElementCopyWithImpl<$Res, _$StimulusElementImpl>
    implements _$$StimulusElementImplCopyWith<$Res> {
  __$$StimulusElementImplCopyWithImpl(
      _$StimulusElementImpl _value, $Res Function(_$StimulusElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recallId = null,
    Object? data = null,
    Object? delay = null,
    Object? cue = freezed,
  }) {
    return _then(_$StimulusElementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recallId: null == recallId
          ? _value.recallId
          : recallId // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      delay: null == delay
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as int,
      cue: freezed == cue
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StimulusElementImpl implements _StimulusElement {
  const _$StimulusElementImpl(
      {required this.id,
      required this.recallId,
      required this.data,
      required this.delay,
      required this.cue});

  factory _$StimulusElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$StimulusElementImplFromJson(json);

  @override
  final int id;
  @override
  final int recallId;
  @override
  final String data;
  @override
  final int delay;
  @override
  final String? cue;

  @override
  String toString() {
    return 'StimulusElement(id: $id, recallId: $recallId, data: $data, delay: $delay, cue: $cue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StimulusElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recallId, recallId) ||
                other.recallId == recallId) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.delay, delay) || other.delay == delay) &&
            (identical(other.cue, cue) || other.cue == cue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, recallId, data, delay, cue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StimulusElementImplCopyWith<_$StimulusElementImpl> get copyWith =>
      __$$StimulusElementImplCopyWithImpl<_$StimulusElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StimulusElementImplToJson(
      this,
    );
  }
}

abstract class _StimulusElement implements StimulusElement {
  const factory _StimulusElement(
      {required final int id,
      required final int recallId,
      required final String data,
      required final int delay,
      required final String? cue}) = _$StimulusElementImpl;

  factory _StimulusElement.fromJson(Map<String, dynamic> json) =
      _$StimulusElementImpl.fromJson;

  @override
  int get id;
  @override
  int get recallId;
  @override
  String get data;
  @override
  int get delay;
  @override
  String? get cue;
  @override
  @JsonKey(ignore: true)
  _$$StimulusElementImplCopyWith<_$StimulusElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
