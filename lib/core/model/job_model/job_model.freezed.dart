// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return _JobModel.fromJson(json);
}

/// @nodoc
mixin _$JobModel {
  @JsonKey(name: 'pk')
  String get jobId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get contactPerson => throw _privateConstructorUsedError;
  int get numberOfWorker => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get startDateTime => throw _privateConstructorUsedError;
  bool get isClaimed => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get endDateTime => throw _privateConstructorUsedError;
  int get claimedNumber => throw _privateConstructorUsedError;

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobModelCopyWith<JobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobModelCopyWith<$Res> {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) then) =
      _$JobModelCopyWithImpl<$Res, JobModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') String jobId,
      String title,
      String description,
      String location,
      String contactPerson,
      int numberOfWorker,
      @DateTimeConverter() DateTime? startDateTime,
      bool isClaimed,
      @DateTimeConverter() DateTime? endDateTime,
      int claimedNumber});
}

/// @nodoc
class _$JobModelCopyWithImpl<$Res, $Val extends JobModel>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? title = null,
    Object? description = null,
    Object? location = null,
    Object? contactPerson = null,
    Object? numberOfWorker = null,
    Object? startDateTime = freezed,
    Object? isClaimed = null,
    Object? endDateTime = freezed,
    Object? claimedNumber = null,
  }) {
    return _then(_value.copyWith(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfWorker: null == numberOfWorker
          ? _value.numberOfWorker
          : numberOfWorker // ignore: cast_nullable_to_non_nullable
              as int,
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isClaimed: null == isClaimed
          ? _value.isClaimed
          : isClaimed // ignore: cast_nullable_to_non_nullable
              as bool,
      endDateTime: freezed == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      claimedNumber: null == claimedNumber
          ? _value.claimedNumber
          : claimedNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobModelImplCopyWith<$Res>
    implements $JobModelCopyWith<$Res> {
  factory _$$JobModelImplCopyWith(
          _$JobModelImpl value, $Res Function(_$JobModelImpl) then) =
      __$$JobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') String jobId,
      String title,
      String description,
      String location,
      String contactPerson,
      int numberOfWorker,
      @DateTimeConverter() DateTime? startDateTime,
      bool isClaimed,
      @DateTimeConverter() DateTime? endDateTime,
      int claimedNumber});
}

/// @nodoc
class __$$JobModelImplCopyWithImpl<$Res>
    extends _$JobModelCopyWithImpl<$Res, _$JobModelImpl>
    implements _$$JobModelImplCopyWith<$Res> {
  __$$JobModelImplCopyWithImpl(
      _$JobModelImpl _value, $Res Function(_$JobModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? title = null,
    Object? description = null,
    Object? location = null,
    Object? contactPerson = null,
    Object? numberOfWorker = null,
    Object? startDateTime = freezed,
    Object? isClaimed = null,
    Object? endDateTime = freezed,
    Object? claimedNumber = null,
  }) {
    return _then(_$JobModelImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfWorker: null == numberOfWorker
          ? _value.numberOfWorker
          : numberOfWorker // ignore: cast_nullable_to_non_nullable
              as int,
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isClaimed: null == isClaimed
          ? _value.isClaimed
          : isClaimed // ignore: cast_nullable_to_non_nullable
              as bool,
      endDateTime: freezed == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      claimedNumber: null == claimedNumber
          ? _value.claimedNumber
          : claimedNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobModelImpl extends _JobModel {
  const _$JobModelImpl(
      {@JsonKey(name: 'pk') this.jobId = '',
      this.title = '',
      this.description = '',
      this.location = '',
      this.contactPerson = '',
      this.numberOfWorker = 0,
      @DateTimeConverter() this.startDateTime,
      this.isClaimed = false,
      @DateTimeConverter() this.endDateTime,
      this.claimedNumber = 0})
      : super._();

  factory _$JobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobModelImplFromJson(json);

  @override
  @JsonKey(name: 'pk')
  final String jobId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String contactPerson;
  @override
  @JsonKey()
  final int numberOfWorker;
  @override
  @DateTimeConverter()
  final DateTime? startDateTime;
  @override
  @JsonKey()
  final bool isClaimed;
  @override
  @DateTimeConverter()
  final DateTime? endDateTime;
  @override
  @JsonKey()
  final int claimedNumber;

  @override
  String toString() {
    return 'JobModel(jobId: $jobId, title: $title, description: $description, location: $location, contactPerson: $contactPerson, numberOfWorker: $numberOfWorker, startDateTime: $startDateTime, isClaimed: $isClaimed, endDateTime: $endDateTime, claimedNumber: $claimedNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobModelImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.numberOfWorker, numberOfWorker) ||
                other.numberOfWorker == numberOfWorker) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.isClaimed, isClaimed) ||
                other.isClaimed == isClaimed) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime) &&
            (identical(other.claimedNumber, claimedNumber) ||
                other.claimedNumber == claimedNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jobId,
      title,
      description,
      location,
      contactPerson,
      numberOfWorker,
      startDateTime,
      isClaimed,
      endDateTime,
      claimedNumber);

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      __$$JobModelImplCopyWithImpl<_$JobModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobModelImplToJson(
      this,
    );
  }
}

abstract class _JobModel extends JobModel {
  const factory _JobModel(
      {@JsonKey(name: 'pk') final String jobId,
      final String title,
      final String description,
      final String location,
      final String contactPerson,
      final int numberOfWorker,
      @DateTimeConverter() final DateTime? startDateTime,
      final bool isClaimed,
      @DateTimeConverter() final DateTime? endDateTime,
      final int claimedNumber}) = _$JobModelImpl;
  const _JobModel._() : super._();

  factory _JobModel.fromJson(Map<String, dynamic> json) =
      _$JobModelImpl.fromJson;

  @override
  @JsonKey(name: 'pk')
  String get jobId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get location;
  @override
  String get contactPerson;
  @override
  int get numberOfWorker;
  @override
  @DateTimeConverter()
  DateTime? get startDateTime;
  @override
  bool get isClaimed;
  @override
  @DateTimeConverter()
  DateTime? get endDateTime;
  @override
  int get claimedNumber;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
