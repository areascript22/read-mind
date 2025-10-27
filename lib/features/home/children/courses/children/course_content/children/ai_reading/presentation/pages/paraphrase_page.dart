import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_feedback.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_paraphrase_tip.dart';
import 'package:flutter/material.dart';

class ParaphrasePage extends StatefulWidget {
  final String originalParagraph;

  const ParaphrasePage({super.key, required this.originalParagraph});

  @override
  State<ParaphrasePage> createState() => _ParaphrasePageState();
}

class _ParaphrasePageState extends State<ParaphrasePage> {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // 👈 allows body to resize when keyboard appears
      appBar: AppBar(
        title: const Text("Paraphrase Activity"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () => showFeedbackDialog(context),
            icon: const Icon(Icons.text_decrease),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              // 👇 ensures it adjusts for keyboard
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Ver párrafo original",
                                style: TextStyle(fontWeight: FontWeight.w600),
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
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.originalParagraph,
                            style: const TextStyle(fontSize: 15, height: 1.5),
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

                      // 👇 Flexible instead of Expanded to avoid overflow
                      Flexible(
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
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _onSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child:
                              _isSubmitting
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text(
                                    "Submit Paraphrase",
                                    style: TextStyle(fontSize: 16),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton.extended(
          onPressed: () => showParaphraseTipDialog(context),
          icon: const Icon(Icons.lightbulb),
          label: const Text("Tips"),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }

  void _onSubmit() async {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor, escribe tu paráfrasis primero."),
        ),
      );
      return;
    }
  }
}
