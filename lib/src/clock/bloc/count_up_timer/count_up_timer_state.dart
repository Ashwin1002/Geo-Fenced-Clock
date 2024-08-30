part of 'count_up_timer_cubit.dart';

class CountUpTimerState extends Equatable {
  final ClockStatus clockStatus;
  final GeofenceStatus geofenceStatus;
  final Duration clockTime;
  final Duration breakTime;

  const CountUpTimerState({
    this.clockStatus = ClockStatus.none,
    this.geofenceStatus = GeofenceStatus.init,
    this.clockTime = Duration.zero,
    this.breakTime = Duration.zero,
  });

  factory CountUpTimerState.initial() => const CountUpTimerState(
        clockStatus: ClockStatus.none,
        clockTime: Duration.zero,
        breakTime: Duration.zero,
        geofenceStatus: GeofenceStatus.init,
      );

  @override
  List<Object?> get props {
    return [
      clockStatus,
      geofenceStatus,
      clockTime,
      breakTime,
    ];
  }

  CountUpTimerState copyWith({
    ClockStatus? clockStatus,
    GeofenceStatus? geofenceStatus,
    Duration? clockTime,
    Duration? breakTime,
  }) {
    return CountUpTimerState(
      clockStatus: clockStatus ?? this.clockStatus,
      geofenceStatus: geofenceStatus ?? this.geofenceStatus,
      clockTime: clockTime ?? this.clockTime,
      breakTime: breakTime ?? this.breakTime,
    );
  }

  @override
  String toString() {
    return 'CountUpTimerState(clockStatus: $clockStatus, geofenceStatus: $geofenceStatus, clockTime: $clockTime, breakTime: $breakTime)';
  }
}
