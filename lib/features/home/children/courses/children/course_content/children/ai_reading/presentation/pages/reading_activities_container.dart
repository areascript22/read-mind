import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/ai_reading_activity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/main_idea_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/paraphrase_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/summary_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/activity_progress/activity_progress_bloc.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cubit/attempts_cubit/attempts_cubit.dart';
import '../cubit/timer_cubit_attempt/timer_attempt_cubit.dart';

class ReadingActivitiesContainer extends StatefulWidget {
  final ActivityModel activityModel;

  ReadingActivitiesContainer({super.key, required this.activityModel});

  @override
  State<ReadingActivitiesContainer> createState() =>
      _ReadingActivitiesContainerState();
}

class _ReadingActivitiesContainerState
    extends State<ReadingActivitiesContainer> {
  final PageController _controller = PageController();
  bool swipeEnabled = false;
  late TimerAttemptCubit timerAttemptCubit;
  int previousOne = 0;

  @override
  void initState() {
    super.initState();
    _initIsSwipeEnabled();
    _initValues();
  }

  void _initValues() {
    timerAttemptCubit = context.read<TimerAttemptCubit>();
    timerAttemptCubit.setStartTime(DateTime.now());
    timerAttemptCubit.setPlayCount(0);
  }

  void _initIsSwipeEnabled() {
    try {
      swipeEnabled =
          (context.read<ActivityProgressBloc>().state as ProgressCreated)
              .createdProgress
              .toReadingProgressEntity()
              ?.subactivitiesCompleted
              .reading ??
          false;
    } catch (e) {
      swipeEnabled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                if (value == 1 && previousOne == 0) {
                  timerAttemptCubit.setCompleteTime(DateTime.now());
                  final readingEntity =
                      widget.activityModel.toAIReadingEntity();
                  final timeSpentSec = timerAttemptCubit.totalTimeSec;
                  if (readingEntity != null) {
                    context.read<AttemptsCubit>().createReadingAttempt(
                      aiReadingId: readingEntity.aiReadingId,
                      playCount: timerAttemptCubit.playCount,
                      timeSpentSec: timeSpentSec,
                    );
                    timerAttemptCubit.setPlayCount(0);
                    timerAttemptCubit.setStartTime(DateTime.now());
                  }
                }
                timerAttemptCubit.setStartTime(DateTime.now());
                previousOne = value;
              },

              physics:
                  swipeEnabled
                      ? BouncingScrollPhysics()
                      : NeverScrollableScrollPhysics(),
              children: [
                AiReadingActivity(activityModel: widget.activityModel),
                ParaphrasePage(
                  aiReadingEntity: widget.activityModel.toAIReadingEntity()!,
                ),
                MainIdeaPage(
                  aiReadingEntity: widget.activityModel.toAIReadingEntity()!,
                ),
                SummaryPage(
                  aiReadingEntity: widget.activityModel.toAIReadingEntity()!,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          _buildPageIndicator(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return SizedBox(
      height: 100,
      child: BlocConsumer<ActivityProgressBloc, ActivityProgressState>(
        builder: (context, state) {
          if (state is ProgressCreated &&
              state.createdProgress
                  .toReadingProgressEntity()!
                  .subactivitiesCompleted
                  .reading) {
            return _buildPageInd();
          }

          if (state is ProgressUpdated &&
              state.updatedProgress
                  .toReadingProgressEntity()!
                  .subactivitiesCompleted
                  .reading) {
            return _buildPageInd();
          }

          return SizedBox();
        },
        listener: (context, state) {
          if (state is ProgressCreated &&
              state.createdProgress
                  .toReadingProgressEntity()!
                  .subactivitiesCompleted
                  .reading) {
            print("Progrss created");
            setState(() {
              swipeEnabled = true;
            });
          }

          if (state is ProgressUpdated &&
              state.updatedProgress
                  .toReadingProgressEntity()!
                  .subactivitiesCompleted
                  .reading) {
            print("Progrss updated");
            setState(() {
              swipeEnabled = true;
            });
          }
        },
      ),
    );
  }

  Widget _buildPageInd() {
    return SmoothPageIndicator(
      controller: _controller,
      count: 4,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Colors.blue,
      ),
    );
  }
}
