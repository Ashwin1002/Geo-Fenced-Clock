import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_fenced_clock/core/core.dart';
import 'package:geo_fenced_clock/core/model/job_model/job_model.dart';
import 'package:geo_fenced_clock/src/src.dart';

class ClockViewScreen extends StatelessWidget {
  const ClockViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountUpTimerCubit>(
          create: (context) => CountUpTimerCubit(),
        ),
      ],
      child: const ClockDetailView(),
    );
  }
}

class ClockDetailView extends StatelessWidget {
  const ClockDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clock Button Example')),
      body: Center(
        child: ClockButton(
          job: JobModel.fakeData(),
          shift: UserJobShiftModel.fakeData(),
          breaks: const [],
        ),
      ),
    );
  }
}
