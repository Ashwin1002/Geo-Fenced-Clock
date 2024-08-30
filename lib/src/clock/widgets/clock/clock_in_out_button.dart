import 'package:flutter/material.dart';
import 'package:geo_fenced_clock/core/core.dart';

class ClockInOutButton extends StatelessWidget {
  const ClockInOutButton({
    super.key,
    this.countdownSeconds,
    this.boxShadow,
    this.onTap,
    this.gradient,
    this.title,
    this.subtitle,
    this.progressColor,
    required this.durationEnd,
  });

  const ClockInOutButton.running({
    super.key,
    required this.countdownSeconds,
    this.onTap,
    this.title,
    this.progressColor,
    required this.durationEnd,
  })  : subtitle = 'Take a break',
        boxShadow = const [
          BoxShadow(
            color: AppColors.redShadowColor,
            spreadRadius: 0,
            blurRadius: 30,
            offset: Offset(0, 12),
          )
        ],
        gradient = const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.redGradient,
        );

  const ClockInOutButton.paused({
    super.key,
    required this.countdownSeconds,
    this.onTap,
    this.title,
    this.boxShadow,
    required this.durationEnd,
  })  : subtitle = 'Resume',
        progressColor = AppColors.greenGradientLeft,
        gradient = const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.greenGradient,
        );
  const ClockInOutButton.authorized({
    super.key,
    this.countdownSeconds,
    this.onTap,
    this.subtitle,
    this.boxShadow,
    this.progressColor,
    required this.durationEnd,
  })  : title = 'Clock In',
        gradient = const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.greenGradient,
        );

  const ClockInOutButton.unauthorized({
    super.key,
    this.countdownSeconds,
    this.onTap,
    this.subtitle,
    this.progressColor,
  })  : title = 'Clock In',
        durationEnd = Duration.zero,
        boxShadow = const [
          BoxShadow(
            color: AppColors.greyShadow,
            spreadRadius: 0,
            blurRadius: 30,
            offset: Offset(0, 12),
          )
        ],
        gradient = const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.greyGradient,
        );

  const ClockInOutButton.clockOut({
    super.key,
    required this.countdownSeconds,
    this.onTap,
    this.title,
    required this.durationEnd,
  })  : subtitle = 'Clock Out',
        progressColor = AppColors.redGradientLeft,
        gradient = const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.redGradient,
        ),
        boxShadow = const [
          BoxShadow(
            color: AppColors.redShadowColor,
            spreadRadius: 0,
            blurRadius: 30,
            offset: Offset(0, 12),
          )
        ];

  final Duration? countdownSeconds;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final String? title;
  final String? subtitle;
  final Color? progressColor;
  final Duration durationEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 214.0,
            width: 214.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                        color: AppColors.greenShadow,
                        spreadRadius: 0,
                        blurRadius: 30,
                        offset: const Offset(0, 12))
                  ],
              gradient: gradient ??
                  const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: AppColors.redGradient,
                  ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null || countdownSeconds != null)
                    Text(
                      title ??
                          durationFormatter(countdownSeconds!.inMilliseconds),
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(color: AppColors.backgroundPrimaryLight),
                    ),
                  if (subtitle != null) ...[
                    6.0.verticalSpace,
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.backgroundPrimaryLight,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
          if (countdownSeconds != null)
            SizedBox.square(
              dimension: 225.0,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                value: _calculateProgress(
                    Duration.zero, durationEnd, countdownSeconds!),
                color: progressColor ?? AppColors.redGradientLeft,
              ),
            )
        ],
      ),
    );
  }
}

double _calculateProgress(Duration start, Duration end, Duration current) {
  // Calculate the total duration between start and end
  int totalDuration = end.inMilliseconds - start.inMilliseconds;

  // Calculate the current duration from start
  int currentDuration = current.inMilliseconds - start.inMilliseconds;

  // Calculate the progress as a value between 0 and 1
  double progress = currentDuration / totalDuration;

  // Ensure the progress is within the range [0, 1]
  if (progress < 0) {
    return 0.0;
  } else if (progress > 1) {
    return 1.0;
  } else {
    return progress;
  }
}
