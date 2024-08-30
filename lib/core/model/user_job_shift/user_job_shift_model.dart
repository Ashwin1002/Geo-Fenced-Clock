import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geo_fenced_clock/core/core.dart';
import 'package:geo_fenced_clock/core/model/job_model/job_model.dart';

part 'user_job_shift_model.freezed.dart';
part 'user_job_shift_model.g.dart';

@Freezed()
class UserJobShiftModel with _$UserJobShiftModel {
  const UserJobShiftModel._();

  const factory UserJobShiftModel({
    @Default('') @JsonKey(name: 'pk') String id,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
    @DateTimeConverter() DateTime? startDateTime,
    @DateTimeConverter() DateTime? endDateTime,
    @Default('') String authorizedPersonName,
    @Default(JobModel.empty) JobModel job,
  }) = _UserJobShiftModel;

  factory UserJobShiftModel.fromJson(Map<String, dynamic> json) =>
      _$UserJobShiftModelFromJson(json);

  static const UserJobShiftModel empty = UserJobShiftModel();

  factory UserJobShiftModel.fakeData() => UserJobShiftModel(
        authorizedPersonName: 'Fake User',
        job: JobModel.fakeData(),
        id: 'fake-job-shift-id',
        startDateTime: null,
        endDateTime: null,
      );

  bool get isJobStarted => startDateTime != null;
  bool get isJobEnded => startDateTime != null && endDateTime != null;

  DateTimeRange? get dateTimeRange =>
      startDateTime != null && endDateTime != null
          ? DateTimeRange(start: startDateTime!, end: endDateTime!)
          : null;

  Duration get totalWorkingHours => dateTimeRange?.duration ?? Duration.zero;

  Duration get currentWorkingHours => isJobEnded
      ? dateTimeRange?.duration ?? Duration.zero
      : isJobStarted
          ? _now.difference(startDateTime!)
          : Duration.zero;
}

DateTime get _now => DateTime.now().toLocal();
