// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_job_shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserJobShiftModel _$UserJobShiftModelFromJson(Map<String, dynamic> json) {
  return _UserJobShiftModel.fromJson(json);
}

/// @nodoc
mixin _$UserJobShiftModel {
  @JsonKey(name: 'pk')
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get startDateTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get endDateTime => throw _privateConstructorUsedError;
  String get authorizedPersonName => throw _privateConstructorUsedError;
  JobModel get job => throw _privateConstructorUsedError;

  /// Serializes this UserJobShiftModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserJobShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserJobShiftModelCopyWith<UserJobShiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJobShiftModelCopyWith<$Res> {
  factory $UserJobShiftModelCopyWith(
          UserJobShiftModel value, $Res Function(UserJobShiftModel) then) =
      _$UserJobShiftModelCopyWithImpl<$Res, UserJobShiftModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') String id,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @DateTimeConverter() DateTime? startDateTime,
      @DateTimeConverter() DateTime? endDateTime,
      String authorizedPersonName,
      JobModel job});

  $JobModelCopyWith<$Res> get job;
}

/// @nodoc
class _$UserJobShiftModelCopyWithImpl<$Res, $Val extends UserJobShiftModel>
    implements $UserJobShiftModelCopyWith<$Res> {
  _$UserJobShiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserJobShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? authorizedPersonName = null,
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
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDateTime: freezed == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorizedPersonName: null == authorizedPersonName
          ? _value.authorizedPersonName
          : authorizedPersonName // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as JobModel,
    ) as $Val);
  }

  /// Create a copy of UserJobShiftModel
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
abstract class _$$UserJobShiftModelImplCopyWith<$Res>
    implements $UserJobShiftModelCopyWith<$Res> {
  factory _$$UserJobShiftModelImplCopyWith(_$UserJobShiftModelImpl value,
          $Res Function(_$UserJobShiftModelImpl) then) =
      __$$UserJobShiftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') String id,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @DateTimeConverter() DateTime? startDateTime,
      @DateTimeConverter() DateTime? endDateTime,
      String authorizedPersonName,
      JobModel job});

  @override
  $JobModelCopyWith<$Res> get job;
}

/// @nodoc
class __$$UserJobShiftModelImplCopyWithImpl<$Res>
    extends _$UserJobShiftModelCopyWithImpl<$Res, _$UserJobShiftModelImpl>
    implements _$$UserJobShiftModelImplCopyWith<$Res> {
  __$$UserJobShiftModelImplCopyWithImpl(_$UserJobShiftModelImpl _value,
      $Res Function(_$UserJobShiftModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserJobShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? authorizedPersonName = null,
    Object? job = null,
  }) {
    return _then(_$UserJobShiftModelImpl(
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
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDateTime: freezed == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorizedPersonName: null == authorizedPersonName
          ? _value.authorizedPersonName
          : authorizedPersonName // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as JobModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJobShiftModelImpl extends _UserJobShiftModel {
  const _$UserJobShiftModelImpl(
      {@JsonKey(name: 'pk') this.id = '',
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt,
      @DateTimeConverter() this.startDateTime,
      @DateTimeConverter() this.endDateTime,
      this.authorizedPersonName = '',
      this.job = JobModel.empty})
      : super._();

  factory _$UserJobShiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJobShiftModelImplFromJson(json);

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
  final DateTime? startDateTime;
  @override
  @DateTimeConverter()
  final DateTime? endDateTime;
  @override
  @JsonKey()
  final String authorizedPersonName;
  @override
  @JsonKey()
  final JobModel job;

  @override
  String toString() {
    return 'UserJobShiftModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, startDateTime: $startDateTime, endDateTime: $endDateTime, authorizedPersonName: $authorizedPersonName, job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJobShiftModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime) &&
            (identical(other.authorizedPersonName, authorizedPersonName) ||
                other.authorizedPersonName == authorizedPersonName) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      startDateTime, endDateTime, authorizedPersonName, job);

  /// Create a copy of UserJobShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJobShiftModelImplCopyWith<_$UserJobShiftModelImpl> get copyWith =>
      __$$UserJobShiftModelImplCopyWithImpl<_$UserJobShiftModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJobShiftModelImplToJson(
      this,
    );
  }
}

abstract class _UserJobShiftModel extends UserJobShiftModel {
  const factory _UserJobShiftModel(
      {@JsonKey(name: 'pk') final String id,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt,
      @DateTimeConverter() final DateTime? startDateTime,
      @DateTimeConverter() final DateTime? endDateTime,
      final String authorizedPersonName,
      final JobModel job}) = _$UserJobShiftModelImpl;
  const _UserJobShiftModel._() : super._();

  factory _UserJobShiftModel.fromJson(Map<String, dynamic> json) =
      _$UserJobShiftModelImpl.fromJson;

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
  DateTime? get startDateTime;
  @override
  @DateTimeConverter()
  DateTime? get endDateTime;
  @override
  String get authorizedPersonName;
  @override
  JobModel get job;

  /// Create a copy of UserJobShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserJobShiftModelImplCopyWith<_$UserJobShiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
