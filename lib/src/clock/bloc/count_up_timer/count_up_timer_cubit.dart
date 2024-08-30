import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_fenced_clock/core/core.dart';

part 'count_up_timer_state.dart';

class CountUpTimerCubit extends Cubit<CountUpTimerState> {
  CountUpTimerCubit() : super(CountUpTimerState.initial());

  Future<void> getCurrentWorkingHours({
    required UserJobShiftModel shift,
    required List<UserJobBreakModel> breaks,
  }) async {
    if (!state.clockStatus.isNone) {
      emit(state.copyWith(clockStatus: ClockStatus.none));
    }

    var breakData = getBreakTimes(breaks);

    log('break time => $breakData');

    log('is paused condition => ${!breakData.isBreakCompleted && breaks.isNotEmpty}');

    ClockStatus? status;

    if ((shift.isJobStarted && breakData.isBreakCompleted) ||
        shift.isJobStarted) {
      status = ClockStatus.running;
    }

    if (!breakData.isBreakCompleted && breaks.isNotEmpty) {
      status = ClockStatus.paused;
    }

    if (shift.isJobEnded) {
      status = ClockStatus.stopped;
    }

    status ??= ClockStatus.initial;

    log('is job ended => ${shift.isJobEnded} and end date time => ${shift.endDateTime}');

    log('clock status => $status');

    ///
    log('user shift => $shift');
    log('user breaks => ${breaks.length}');

    emit(
      state.copyWith(
        clockStatus: status,
        clockTime: shift.currentWorkingHours,
        breakTime: breakData.isBreakCompleted
            ? breakData.totalBreakDuration
            : breakData.ongoingBreakTime,
      ),
    );
  }

  void updateStatus(ClockStatus status) =>
      emit(state.copyWith(clockStatus: status));

  // }

  void checkUserGeofenceStatus(GeofenceStatus status) {
    emit(state.copyWith(geofenceStatus: status));
  }

  FutureOr<void> clockIn() async {
    // update status to running
    updateStatus(ClockStatus.running);
  }

  FutureOr<void> takeABreak() async {
    // update status to paused
    updateStatus(ClockStatus.paused);
  }

  FutureOr<void> resumeJob() async {
    // update clock status to running
    updateStatus(ClockStatus.running);
  }

  FutureOr<void> clockOut() async {
    // update status to running
    updateStatus(ClockStatus.stopped);
  }
}
