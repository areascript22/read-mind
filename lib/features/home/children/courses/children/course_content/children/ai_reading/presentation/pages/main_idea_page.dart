import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/cubit/attempts_cubit/attempts_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_feedback_main_idea.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_main_idea_attempts.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_main_idea_tip.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../../../shared/widgets/loader_indicator.dart';
import '../../../../presentation/bloc/activity_progress/activity_progress_bloc.dart';
import '../bloc/ai_reading_bloc/ai_reading_bloc.dart';
import '../cubit/ai_reading_progress_cubit/ai_reading_progress_cubit.dart';

class MainIdeaPage extends StatefulWidget {
  final AIReadingEntity aiReadingEntity;

  const MainIdeaPage({super.key, required this.aiReadingEntity});

  @override
  State<MainIdeaPage> createState() => _MainIdeaPageState();
}

class _MainIdeaPageState extends State<MainIdeaPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    context.read<AiReadingProgressCubit>().loadMainIdeaProgress(
      widget.aiReadingEntity.id,
    );
  }

  void _submitMainIdea(BuildContext context) {
    if (_controller.text.trim().isEmpty) {
      ToastMessageUtil.showToast("Escribe algo para continuar", context);
      return;
    }
    context.read<AiReadingBloc>().add(
      EvaluateMainIdeaEvent(
        paragraph: widget.aiReadingEntity.content,
        mainIdea: _controller.text,
        activityId: widget.aiReadingEntity.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AiReadingBloc, AiReadingState>(
      listener: (context, state) {
        if (state is AiReadingError &&
            state.actionType == AiActionType.mainIdea) {
          ToastMessageUtil.showToast(state.message, context);
        }
        if (state is MainIdeaSuccess) {
          showFeedbackMainIdeaDialog(context, state.feedbackEntity);
          context.read<AiReadingProgressCubit>().loadMainIdeaProgress(
            widget.aiReadingEntity.id,
          );

          context.read<ActivityProgressBloc>().add(
            UpdateProgressEvent(
              activityId: widget.aiReadingEntity.id,
              dataToUpdate: {"mainIdeaCompleted": true},
            ),
          );

          context.read<AttemptsCubit>().createMainIdeaAttempt(
            aiReadingId: widget.aiReadingEntity.aiReadingId,
            accuracyScore: state.feedbackEntity.accuracyScore,
            clarityScore: state.feedbackEntity.clarityScore,
            concisenessScore: state.feedbackEntity.concisenessScore,
            feedback: state.feedbackEntity.feedback,
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state is AiReadingLoading &&
            state.actionType == AiActionType.mainIdea;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Main Idea Avtivity"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              BlocConsumer<AttemptsCubit, AttemptsState>(
                builder: (context, state) {
                  if (state is AttemptsLoading &&
                      state.attemptOperation == AttemptOperation.mainIdea) {
                    return LoaderIndicator(spinnerSize: 20);
                  }
                  if (state is AttemptMainIdeaCreated) {
                    return IconButton(
                      onPressed: () {
                        showMainIdeaAttemptsDialog(context);
                      },
                      icon: Icon(Icons.book),
                    );
                  }
                  return IconButton(
                    onPressed: () {
                      showMainIdeaAttemptsDialog(context);
                    },
                    icon: Icon(Icons.book),
                  );
                },
                listener: (context, state) {
                  if (state is AttemptsError &&
                      state.attemptOperation == AttemptOperation.mainIdea) {
                    ToastMessageUtil.showToast(state.message, context);
                  }
                },
              ),
              BlocBuilder<AiReadingProgressCubit, AiReadingProgressState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return LoaderIndicator(
                      spinnerSize: 20,
                      spinnerColor: Colors.white,
                    );
                  }
                  if (state
                          .progressByActivity[widget.aiReadingEntity.id]
                          ?.mainIdea ??
                      false) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.check),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:
                                    () => setState(
                                      () => _isExpanded = !_isExpanded,
                                    ),
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                      width: 0.6,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Ver párrafo original",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Icon(
                                        _isExpanded
                                            ? Icons.expand_less
                                            : Icons.expand_more,
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              AnimatedCrossFade(
                                firstChild: const SizedBox.shrink(),
                                secondChild: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 16,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    widget.aiReadingEntity.content,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                crossFadeState:
                                    _isExpanded
                                        ? CrossFadeState.showSecond
                                        : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 250),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                "Ahora escribe el párrafo con tus propias palabras:",
                                style: theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              _buildRichTextField(),
                              const SizedBox(height: 20),
                              _buildSubmitButton(isLoading, context),
                              const SizedBox(height: 15),
                              _buildNextButton(),
                              // CustomButton(
                              //   color: Colors.green,
                              //   onTap:
                              //       () => context.push(
                              //         RouteNames.activitySummary,
                              //         extra: widget.originalParagraph,
                              //       ),
                              //   child: Text("Siguiente actividad"),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withValues(alpha: 0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
          floatingActionButton: _buildFloatingActionButton(context),
        );
      },
    );
  }

  Widget _buildNextButton() {
    return BlocConsumer<AiReadingProgressCubit, AiReadingProgressState>(
      builder: (context, state) {
        if (state.isLoading) {
          return LoaderIndicator();
        }
        if (state.progressByActivity[widget.aiReadingEntity.id]?.mainIdea ??
            false) {
          return ElevatedButton.icon(
            onPressed: () {
              context.push(
                RouteNames.activitySummary,
                extra: widget.aiReadingEntity,
              );
            },
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Siguiente actividad'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(double.infinity, 45),
            ),
          );
        }
        return SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }

  SizedBox _buildSubmitButton(bool isLoading, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _submitMainIdea(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child:
            isLoading
                ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
                : const Text(
                  "Submit main idea",
                  style: TextStyle(fontSize: 16),
                ),
      ),
    );
  }

  Flexible _buildRichTextField() {
    return Flexible(
      child: TextField(
        controller: _controller,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: "Escribe tu paráfrasis aquí...",
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
          ),
        ),
      ),
    );
  }

  Padding _buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: FloatingActionButton.extended(
        onPressed: () => showMainIdeaTipDialog(context),
        icon: const Icon(Icons.lightbulb),
        label: const Text("Tips"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
