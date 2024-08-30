import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geo_fenced_clock/core/core.dart';
import 'package:geo_fenced_clock/core/model/job_model/job_model.dart';

part 'user_job_break_model.freezed.dart';
part 'user_job_break_model.g.dart';

@Freezed()
class UserJobBreakModel with _$UserJobBreakModel {
  const UserJobBreakModel._();
  const factory UserJobBreakModel({
    @Default('') @JsonKey(name: 'pk') String id,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
    @DateTimeConverter() DateTime? breakIn,
    @DateTimeConverter() DateTime? breakOut,
    @Default(JobModel.empty) JobModel job,
  }) = _UserJobBreakModel;

  factory UserJobBreakModel.fromJson(Map<String, dynamic> json) =>
      _$UserJobBreakModelFromJson(json);

  static const UserJobBreakModel empty = UserJobBreakModel();

  factory UserJobBreakModel.fakeData() => UserJobBreakModel(
        breakIn: DateTime.now().add(const Duration(minutes: 5)),
        breakOut: DateTime.now().add(const Duration(minutes: 15)),
        job: JobModel.fakeData(),
      );

  bool get isEmpty => this == UserJobBreakModel.empty;

  DateTimeRange? get breakDateRange => breakIn != null && breakOut != null
      ? DateTimeRange(start: breakIn!, end: breakOut!)
      : null;

  Duration get totalBreakTime => breakDateRange?.duration ?? Duration.zero;

  bool get isBreakStarted => breakIn != null;

  bool get isBreakEnded => breakIn != null && breakOut != null;
}

({
  Duration ongoingBreakTime,
  Duration totalBreakDuration,
  bool isBreakCompleted,
}) getBreakTimes(List<UserJobBreakModel> breakTimes) {
  Duration totalBreakDuration = Duration.zero;
  var now = DateTime.now().toLocal();

  var isBreakCompleted = breakTimes.isEmpty
      ? false
      : breakTimes.every((element) => element.isBreakEnded);

  var ongoingBreak = breakTimes.firstWhere(
    (breakTime) => !breakTime.isBreakEnded,
    orElse: () => UserJobBreakModel.empty,
  );

  var ongoingBreakTime = ongoingBreak.isEmpty || ongoingBreak.breakIn == null
      ? Duration.zero
      : now.difference(ongoingBreak.breakIn!);

  var totalBreaks = breakTimes
      .map((e) => e.breakDateRange)
      .whereType<DateTimeRange>()
      .toList();

  for (var breakTime in totalBreaks) {
    totalBreakDuration += breakTime.duration;
  }

  return (
    ongoingBreakTime: ongoingBreakTime,
    totalBreakDuration: totalBreakDuration,
    isBreakCompleted: isBreakCompleted,
  );
}
