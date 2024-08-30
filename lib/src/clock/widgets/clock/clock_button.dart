import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_fenced_clock/core/core.dart';
import 'package:geo_fenced_clock/core/model/job_model/job_model.dart';
import 'package:geo_fenced_clock/src/src.dart';
import 'package:geolocator/geolocator.dart';

///
/// The `ClockButton` widget represents a UI component for managing job-related clock actions
/// such as Clock In, Clock Out, Break In, and Break Out. It displays a circular progress
/// bar around a timer and clock status, and manages various states such as running, paused,
/// and stopped.
///
/// Clock status is managed using the [ClockStatus] enum, which includes the following states:
/// - initial
/// - running
/// - paused
/// - stopped
///
class ClockButton extends StatefulWidget {
  const ClockButton({
    super.key,
    required this.job,
    required this.breaks,
    required this.shift,
  });

  ///
  /// Job Model which holds information about current job
  ///
  final JobModel job;

  ///
  /// Holds information about no. of breaks taken by user
  ///
  final List<UserJobBreakModel> breaks;

  ///
  /// Holds the information about shift of the job done by user
  ///
  final UserJobShiftModel shift;

  @override
  State<ClockButton> createState() => _ClockButtonState();
}

class _ClockButtonState extends State<ClockButton> with WidgetsBindingObserver {
  final GeoFencing _geoFencing = GeoFencing();

  ///
  /// Holds information about the user's current position including latitude and longitude.
  /// It can be null if the location permission is not granted.
  ///
  late Position? userPosition;

  ///
  /// Stopwatch used for managing the main clock-in and clock-out timing.
  ///
  late Stopwatch _stopwatch;

  ///
  /// Stopwatch used for managing break-in and break-out timing.
  ///
  late Stopwatch _breakStopWatch;

  ///
  /// Cubit used to persist the state of the stopwatch timer and clock status.
  ///
  late CountUpTimerCubit _timerCubit;

  ///
  /// Stream subscription used to listen to geofencing data related to the facility location.
  ///
  StreamSubscription<GeofenceStatus>? geofenceStatusStream;

  ///
  /// Timer used to periodically check if the [_stopwatch] exceeds the total job duration
  /// and updates the widget accordingly.
  ///
  Timer? timer;

  ///
  /// Timer used to periodically update the "take a break" widget every second.
  ///
  Timer? breakTimer;

  ///
  /// Notifier for location permission, updated on initialization and when the app resumes.
  ///
  ValueNotifier<LocationPermission> locationPermission =
      ValueNotifier(LocationPermission.unableToDetermine);

  @override
  void initState() {
    super.initState();
    _timerCubit = context.read<CountUpTimerCubit>();

    // Initialize location and geofencing data.
    unawaited(_initializeLocationAndGeoFencing());

    // Initialize the stopwatches.
    _stopwatch = Stopwatch();
    _breakStopWatch = Stopwatch();
  }

  @override
  void dispose() {
    // Reset stopwatches and stop geofencing service upon disposal.
    _stopwatch.reset();
    _breakStopWatch.reset();
    _geoFencing.stopGeoFencingService();
    unawaited(geofenceStatusStream?.cancel());
    timer?.cancel();
    breakTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ClockButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reinitialize cubit and stopwatches if there is any change in job, breaks, or shift data.
    if (oldWidget.breaks != widget.breaks ||
        oldWidget.job != widget.job ||
        oldWidget.shift != widget.shift) {
      _timerCubit = context.read<CountUpTimerCubit>();
      _stopwatch = Stopwatch();
      _breakStopWatch = Stopwatch();
      unawaited(_initializeLocationAndGeoFencing());
      unawaited(
        _timerCubit.getCurrentWorkingHours(
          shift: widget.shift,
          breaks: widget.breaks,
        ),
      );
    }
  }

  ///
  /// Initialize location permissions and geofencing service.
  ///
  Future<void> _initializeLocationAndGeoFencing() async {
    // get location permission
    locationPermission.value =
        await _geoFencing.checkAndRequestLocationPermission(context);

    userPosition = await _geoFencing.getCurrentPosition();

    // Start geofencing service with the job's facility location.
    _geoFencing.startGeoFencingService(
      latitude: '27.7172',
      longitude: '85.3240',
    );

    // Listen to geofencing status updates.
    geofenceStatusStream = EasyGeofencing.getGeofenceStream()?.listen(
      (GeofenceStatus status) {
        if (_timerCubit.isClosed) return;
        _timerCubit.checkUserGeofenceStatus(status);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Listener for clock status changes.
        BlocListener<CountUpTimerCubit, CountUpTimerState>(
          listenWhen: (previous, current) =>
              previous.clockStatus != current.clockStatus,
          listener: (context, state) {
            state.clockStatus.listenWhen(
              initial: () {},
              running: () => _startTimer(context),
              paused: () => _pauseTimer(context),
              stopped: _stopTimer,
            );
          },
        ),
      ],

      // Display appropriate widget based on location permission status.
      child: _permissionStatusWidget(),
    );
  }

  ///
  /// Widget to handle and display different UI based on location permission status.
  ///
  Widget _permissionStatusWidget() {
    return ValueListenableBuilder<LocationPermission>(
      valueListenable: locationPermission,
      builder: (context, permission, child) {
        log('permssion status => $permission');
        if (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) {
          return child!;
        } else if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Location permission is denied. Please enable location permission to start/end job.'
                      .hardcoded,
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.negativeLight.withOpacity(.25),
                  ),
                  onPressed: () async =>
                      await _geoFencing.openLocationSettings(),
                  child: Text(
                    'Open Settings'.hardcoded,
                    style: const TextStyle(
                      color: AppColors.negativeLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomLoadingWidget(),
              20.verticalSpace,
              Text(
                'Fetching user location...'.hardcoded,
                // style: context.textStyle.bodyMedium,
              ),
            ],
          ),
        );
      },

      /// Isolate the build for animated switch
      child: RepaintBoundary(child: _buildAnimatedSwitch()),
    );
  }

  ///
  /// Build the UI for the animated switch, managing different clock states.
  ///
  Widget _buildAnimatedSwitch() {
    return BlocBuilder<CountUpTimerCubit, CountUpTimerState>(
      buildWhen: (p, c) =>
          p.clockStatus != c.clockStatus ||
          p.geofenceStatus != c.geofenceStatus ||
          p.clockTime != c.clockTime ||
          p.breakTime != c.breakTime,
      builder: (context, state) {
        return AnimatedSwitcher(
          // Duration of the animation
          duration: const Duration(milliseconds: 350),
          // Animation curve for incoming widgets
          switchInCurve: Curves.easeIn,
          // Animation curve for outgoing widgets
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              // Use ScaleTransition for scale animation
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          // clock button view
          child: GeolocationWiseButton(
            job: widget.job,
            clockBuilder: _buildClockView,
          ),
        );
      },
    );
  }

  ///
  /// Builds the clock view widget based on the current clock status.
  ///
  Widget _buildClockView({
    required ClockStatus status,
    required int seconds,
    required int breakSeconds,
  }) {
    return status.when(
      // when clock status in none
      none: () => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomLoadingWidget(),
            20.0.verticalSpace,
            Text(
              'Syncing User Working Time....'.hardcoded,
              // style: context.textStyle.bodyMedium,
            ),
          ],
        ),
      ),

      /// when clockin is authorized
      initial: () => ClockInOutButton.authorized(
        key: const Key('clockIn'),
        durationEnd: widget.job.totalDuration,
        countdownSeconds: _stopwatch.elapsed,
        onTap: () async => _timerCubit..clockIn(),
      ),

      /// when clock os running
      running: () => FlipClockButton(
        countdown: Duration(seconds: _stopwatch.elapsed.inSeconds + seconds),
        totalDuration: widget.job.totalDuration,
        onTap: () async => _timerCubit.updateStatus(ClockStatus.stopped),
        child: ClockInOutButton.running(
          countdownSeconds:
              Duration(seconds: _stopwatch.elapsed.inSeconds + seconds),
          key: const Key('clocked_in'),
          durationEnd: widget.job.totalDuration,
          onTap: () async => _timerCubit..takeABreak(),
        ),
      ),

      /// when clock is paused
      paused: () => ClockInOutButton.paused(
        key: const Key('paused'),
        durationEnd: widget.job.totalDuration,
        countdownSeconds: Duration(
          seconds: _breakStopWatch.elapsed.inSeconds + breakSeconds,
        ),
        onTap: () async => _timerCubit..resumeJob(),
      ),

      /// when clock is stopped
      stopped: () => ClockInOutButton.clockOut(
        key: const Key('clocked_out'),
        countdownSeconds: Duration(
          seconds: _stopwatch.elapsed.inSeconds + seconds,
        ),
        durationEnd: widget.job.totalDuration,
      ),

      /// when clock out is pressed
    );
  }

  ///
  /// Starts the main timer and updates UI components accordingly.
  ///
  void _startTimer(BuildContext context) {
    _stopwatch.start();

    if (_breakStopWatch.isRunning) {
      _breakStopWatch.stop();
    }

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_stopwatch.elapsed.inSeconds <=
            (widget.job.totalDuration.inSeconds)) {}

        if (mounted) setState(() {});
      },
    );

    if (breakTimer?.isActive == true) {
      breakTimer?.cancel();
    }
  }

  ///
  /// Pauses the main timer and updates UI components accordingly.
  ///
  void _pauseTimer(BuildContext context) {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }

    _breakStopWatch.start();

    breakTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) setState(() {});
      },
    );

    if (timer?.isActive == true) {
      timer?.cancel();
    }
  }

  ///
  /// Stops the main timer and updates UI components accordingly.
  ///
  void _stopTimer() {
    if (timer?.isActive == true) {
      timer?.cancel();
    }
    if (breakTimer?.isActive == true) {
      breakTimer?.cancel();
    }

    if (_breakStopWatch.isRunning) {
      _breakStopWatch.stop();
    }

    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }
  }
}
