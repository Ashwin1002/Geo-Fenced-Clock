import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geo_fenced_clock/core/core.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@Freezed()
class JobModel with _$JobModel {
  const JobModel._(); // Private constructor for custom getters

  const factory JobModel({
    @Default('') @JsonKey(name: 'pk') String jobId,
    @Default('') String title,
    @Default('') String description,
    @Default('') String location,
    @Default('') String contactPerson,
    @Default(0) int numberOfWorker,
    @DateTimeConverter() DateTime? startDateTime,
    @Default(false) bool isClaimed,
    @DateTimeConverter() DateTime? endDateTime,
    @Default(0) int claimedNumber,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  static const JobModel empty = JobModel();

  factory JobModel.fakeData() => JobModel(
        title: 'New Job At Nepal',
        description:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        claimedNumber: 10,
        numberOfWorker: 10,
        contactPerson: 'Manish Thapaliya',
        isClaimed: false,
        jobId: 'fake-job-id',
        location: 'Lake side road, 13th street, Pokhara, Nepal',
        endDateTime: DateTime(2024, 09, 02).add(const Duration(hours: 1)),
        startDateTime: DateTime(2024, 09, 02),
      );

  DateTimeRange? get dateTimeRange {
    if (startDateTime == null && endDateTime == null) {
      return null;
    }

    if (!endDateTime!.isAfter(startDateTime!)) {
      return null;
    }
    return DateTimeRange(
      start: startDateTime ?? DateTime.now().toUtc(),
      end: endDateTime ??
          DateTime.now().toUtc().add(
                const Duration(seconds: 1),
              ),
    );
  }

  Duration get totalDuration => dateTimeRange?.duration ?? Duration.zero;

  DateTime? get minStartDate =>
      startDateTime?.subtract(const Duration(minutes: 15));

  DateTime? get maxStartDate => startDateTime?.add(const Duration(minutes: 15));

  DateTime? get minEndDate =>
      endDateTime?.subtract(const Duration(minutes: 15));

  DateTime? get maxEndDate => endDateTime?.add(const Duration(minutes: 15));

  TimeOfDay? get startTime =>
      startDateTime != null ? TimeOfDay.fromDateTime(startDateTime!) : null;

  TimeOfDay? get endTime =>
      endDateTime != null ? TimeOfDay.fromDateTime(endDateTime!) : null;

  bool get canStartJob {
    DateTime? startDate;

    if (startDateTime != null) {
      startDate = startDateTime?.isUtc == true ? startDateTime! : startDateTime;
    }

    if (startDate != null) {
      return _now.isAtSameMomentAs(startDate) ||
          _now.isAtSameMomentAs(minStartDate!) ||
          _now.isAtSameMomentAs(maxStartDate!) ||
          (_now.isAfter(minStartDate!) && _now.isBefore(maxStartDate!));
    }
    return false;
  }

  bool get isOnGoingJob {
    if (startDateTime != null && endDateTime != null) {
      return _now.isAtSameMomentAs(startDateTime!) ||
          _now.isAtSameMomentAs(endDateTime!) ||
          _now.isAtSameMomentAs(minStartDate!) ||
          _now.isAtSameMomentAs(maxStartDate!) ||
          (_now.isAfter(minStartDate!) && _now.isBefore(endDateTime!));
    }
    return false;
  }

  bool get isJobEnded {
    if (endDateTime != null) {
      return _now.isAfter(endDateTime!);
    }
    return false;
  }

  String get formattedTimeRange =>
      '${formatTime(startTime)} - ${formatTime(endTime)}';

  bool get canWithDraw =>
      startDateTime != null &&
      _now.isBefore(startDateTime!.subtract(const Duration(hours: 12)));

  JobWorkingStatus get workingStatus {
    JobWorkingStatus? status;
    if (canStartJob) {
      status = JobWorkingStatus.started;
    } else if (isOnGoingJob) {
      status = JobWorkingStatus.ongoing;
    } else if (isJobEnded) {
      status = JobWorkingStatus.ended;
    }

    return status ?? JobWorkingStatus.none;
  }
}

DateTime get _now => DateTime.now().toLocal();
