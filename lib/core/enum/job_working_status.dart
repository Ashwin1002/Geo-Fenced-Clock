enum JobWorkingStatus {
  none,
  started,
  ongoing,
  ended;

  bool get isNone => this == JobWorkingStatus.none;

  bool get isStarted => this == JobWorkingStatus.started;
  bool get isOngoing => this == JobWorkingStatus.ongoing;
  bool get isEnded => this == JobWorkingStatus.ended;
}
