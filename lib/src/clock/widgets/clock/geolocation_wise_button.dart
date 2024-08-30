import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_fenced_clock/core/core.dart';
import 'package:geo_fenced_clock/core/model/job_model/job_model.dart';
import 'package:geo_fenced_clock/src/src.dart';
import 'package:intl/intl.dart';

typedef ClockViewBuilder = Widget Function({
  required ClockStatus status,
  required int seconds,
  required int breakSeconds,
});

class GeolocationWiseButton extends StatelessWidget {
  const GeolocationWiseButton({
    super.key,
    required this.job,
    required this.clockBuilder,
  });

  final JobModel job;
  final ClockViewBuilder clockBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CountUpTimerCubit, CountUpTimerState>(
      buildWhen: (previous, current) =>
          previous.geofenceStatus != current.geofenceStatus ||
          previous.clockStatus != current.clockStatus ||
          previous.clockTime != current.clockTime ||
          previous.breakTime != current.breakTime,
      builder: (context, state) {
        return state.geofenceStatus.when(
          initial: () => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLoadingWidget(),
                20.0.verticalSpace,
                Text(
                  'Checking Geofence Status...'.hardcoded,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          enter: () => job.canStartJob || job.workingStatus.isOngoing
              ? clockBuilder(
                  status: state.clockStatus,
                  seconds: state.clockTime.inSeconds,
                  breakSeconds: state.breakTime.inSeconds,
                )
              : ClockInOutButton.unauthorized(
                  key: const Key('time_requirement_not_met'),
                  onTap: () {
                    switch (job.workingStatus) {
                      case JobWorkingStatus.none:
                        if (job.maxStartDate == null) return;
                        Snack.error(
                          context,
                          'Sorry, Job cannot start before ${DateFormat('hh:mm a').format(job.minStartDate!)}'
                              .hardcoded,
                        );
                      case JobWorkingStatus.ended:
                        Snack.error(
                            context, 'Sorry, the job has ended.'.hardcoded);
                      default:
                    }
                  },
                ),
          exit: () => ClockInOutButton.unauthorized(
            key: const Key('unauthorized'),
            onTap: () => Snack.error(
              context,
              'You are not in a working location, cannot clock in/out'
                  .hardcoded,
            ),
          ),
        );
      },
    );
  }
}
