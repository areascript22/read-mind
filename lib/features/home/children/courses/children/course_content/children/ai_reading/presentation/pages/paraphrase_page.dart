import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_feedback.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_paraphrase_tip.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/ai_reading_bloc/ai_reading_bloc.dart';

class ParaphrasePage extends StatefulWidget {
  final String originalParagraph;

  const ParaphrasePage({super.key, required this.originalParagraph});

  @override
  State<ParaphrasePage> createState() => _ParaphrasePageState();
}

class _ParaphrasePageState extends State<ParaphrasePage> {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false;

  void _submitParaphrase(BuildContext context) {
    if (_controller.text.trim().isEmpty) {
      ToastMessageUtil.showToast("Escribe algo para continuar", context);
      return;
    }
    context.read<AiReadingBloc>().add(
      EvaluateParaphraseEvent(
        paragraph: widget.originalParagraph,
        paraphrase: _controller.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AiReadingBloc, AiReadingState>(
      listener: (context, state) {
        if (state is AiReadingError &&
            state.actionType == AiActionType.paraphrase) {
          ToastMessageUtil.showToast(state.message, context);
        }
        if (state is AiReadingSuccess &&
            state.actionType == AiActionType.paraphrase) {
          showFeedbackDialog(context, state.feedbackEntity);
        }
      },
      builder: (context, state) {
        final isLoading =
            state is AiReadingLoading &&
            state.actionType == AiActionType.paraphrase;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Paraphrase Activity"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
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
                                    widget.originalParagraph,
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
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed:
                                      isLoading
                                          ? null
                                          : () => _submitParaphrase(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    disabledBackgroundColor:
                                        Colors.grey.shade400,
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
                                            "Submit Paraphrase",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                ),
                              ),
                              SizedBox(height: 15),
                              CustomButton(
                                color: Colors.green,
                                onTap:
                                    () => context.push(
                                      RouteNames.activityMainIdea,
                                      extra: widget.originalParagraph,
                                    ),
                                child: Text("Siguiente actividad"),
                              ),
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
                  child: const Center(child: LoaderIndicator()),
                ),
            ],
          ),
          floatingActionButton: _buildFloatingActionButton(context),
        );
      },
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
        onPressed: () => showParaphraseTipDialog(context),
        icon: const Icon(Icons.lightbulb),
        label: const Text("Tips"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
