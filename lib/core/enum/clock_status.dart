enum ClockStatus {
  none,
  initial,
  running,
  paused,
  stopped;

  bool get isNone => this == ClockStatus.none;
  bool get isInitial => this == ClockStatus.initial;
  bool get isRunning => this == ClockStatus.running;
  bool get ispaused => this == ClockStatus.paused;
  bool get isStopped => this == ClockStatus.stopped;
}

extension ClockStatusExt on ClockStatus {
  A when<A>({
    required A Function() initial,
    required A Function() running,
    required A Function() paused,
    required A Function() stopped,
    required A Function() none,
  }) {
    return switch (this) {
      ClockStatus.running => running(),
      ClockStatus.paused => paused(),
      ClockStatus.stopped => stopped(),
      ClockStatus.initial => initial(),
      ClockStatus.none => none(),
    };
  }

  void listenWhen({
    required void Function() initial,
    required void Function() running,
    required void Function() paused,
    required void Function() stopped,
  }) {
    switch (this) {
      case ClockStatus.running:
        running();
      case ClockStatus.paused:
        paused();
      case ClockStatus.stopped:
        stopped();
      default:
        initial();
    }
  }
}
