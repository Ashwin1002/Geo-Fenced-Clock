// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_job_break_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserJobBreakModel _$UserJobBreakModelFromJson(Map<String, dynamic> json) {
  return _UserJobBreakModel.fromJson(json);
}

/// @nodoc
mixin _$UserJobBreakModel {
  @JsonKey(name: 'pk')
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get breakIn => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get breakOut => throw _privateConstructorUsedError;
  JobModel get job => throw _privateConstructorUsedError;

  /// Serializes this UserJobBreakModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserJobBreakModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserJobBreakModelCopyWith<UserJobBreakModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJobBreakModelCopyWith<$Res> {
  factory $UserJobBreakModelCopyWith(
          UserJobBreakModel value, $Res Function(UserJobBreakModel) then) =
      _$UserJobBreakModelCopyWithImpl<$Res, UserJobBreakModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') String id,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @DateTimeConverter() DateTime? breakIn,
      @DateTimeConverter() DateTime? breakOut,
      JobModel job});

  $JobModelCopyWith<$Res> get job;
}

/// @nodoc
class _$UserJobBreakModelCopyWithImpl<$Res, $Val extends UserJobBreakModel>
    implements $UserJobBreakModelCopyWith<$Res> {
  _$UserJobBreakModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserJobBreakModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? breakIn = freezed,
    Object? breakOut = freezed,
    Object? job = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakIn: freezed == breakIn
          ? _value.breakIn
          : breakIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakOut: freezed == breakOut
          ? _value.breakOut
          : breakOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as JobModel,
    ) as $Val);
  }

  /// Create a copy of UserJobBreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JobModelCopyWith<$Res> get job {
    return $JobModelCopyWith<$Res>(_value.job, (value) {
      return _then(_value.copyWith(job: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserJobBreakModelImplCopyWith<$Res>
    implements $UserJobBreakModelCopyWith<$Res> {
  factory _$$UserJobBreakModelImplCopyWith(_$UserJobBreakModelImpl value,
          $Res Function(_$UserJobBreakModelImpl) then) =
      __$$UserJobBreakModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') String id,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @DateTimeConverter() DateTime? breakIn,
      @DateTimeConverter() DateTime? breakOut,
      JobModel job});

  @override
  $JobModelCopyWith<$Res> get job;
}

/// @nodoc
class __$$UserJobBreakModelImplCopyWithImpl<$Res>
    extends _$UserJobBreakModelCopyWithImpl<$Res, _$UserJobBreakModelImpl>
    implements _$$UserJobBreakModelImplCopyWith<$Res> {
  __$$UserJobBreakModelImplCopyWithImpl(_$UserJobBreakModelImpl _value,
      $Res Function(_$UserJobBreakModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserJobBreakModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? breakIn = freezed,
    Object? breakOut = freezed,
    Object? job = null,
  }) {
    return _then(_$UserJobBreakModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakIn: freezed == breakIn
          ? _value.breakIn
          : breakIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakOut: freezed == breakOut
          ? _value.breakOut
          : breakOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as JobModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJobBreakModelImpl extends _UserJobBreakModel {
  const _$UserJobBreakModelImpl(
      {@JsonKey(name: 'pk') this.id = '',
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt,
      @DateTimeConverter() this.breakIn,
      @DateTimeConverter() this.breakOut,
      this.job = JobModel.empty})
      : super._();

  factory _$UserJobBreakModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJobBreakModelImplFromJson(json);

  @override
  @JsonKey(name: 'pk')
  final String id;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;
  @override
  @DateTimeConverter()
  final DateTime? breakIn;
  @override
  @DateTimeConverter()
  final DateTime? breakOut;
  @override
  @JsonKey()
  final JobModel job;

  @override
  String toString() {
    return 'UserJobBreakModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, breakIn: $breakIn, breakOut: $breakOut, job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJobBreakModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.breakIn, breakIn) || other.breakIn == breakIn) &&
            (identical(other.breakOut, breakOut) ||
                other.breakOut == breakOut) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, breakIn, breakOut, job);

  /// Create a copy of UserJobBreakModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJobBreakModelImplCopyWith<_$UserJobBreakModelImpl> get copyWith =>
      __$$UserJobBreakModelImplCopyWithImpl<_$UserJobBreakModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJobBreakModelImplToJson(
      this,
    );
  }
}

abstract class _UserJobBreakModel extends UserJobBreakModel {
  const factory _UserJobBreakModel(
      {@JsonKey(name: 'pk') final String id,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt,
      @DateTimeConverter() final DateTime? breakIn,
      @DateTimeConverter() final DateTime? breakOut,
      final JobModel job}) = _$UserJobBreakModelImpl;
  const _UserJobBreakModel._() : super._();

  factory _UserJobBreakModel.fromJson(Map<String, dynamic> json) =
      _$UserJobBreakModelImpl.fromJson;

  @override
  @JsonKey(name: 'pk')
  String get id;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @DateTimeConverter()
  DateTime? get breakIn;
  @override
  @DateTimeConverter()
  DateTime? get breakOut;
  @override
  JobModel get job;

  /// Create a copy of UserJobBreakModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserJobBreakModelImplCopyWith<_$UserJobBreakModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
