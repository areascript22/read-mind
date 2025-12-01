import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/paragraph_metadata.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/course_content/course_content_bloc.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class GenerateParagraphPage extends StatefulWidget {
  final int courseid;
  const GenerateParagraphPage({super.key, required this.courseid});

  @override
  State<GenerateParagraphPage> createState() => _GenerateParagraphPageState();
}

class _GenerateParagraphPageState extends State<GenerateParagraphPage> {
  final TextEditingController _paragraphController = TextEditingController();
  final TextEditingController _customTopicController = TextEditingController();
  String? _selectedTopic;
  bool _showCustomInput = false;

  // New selections for length, complexity, style
  String _selectedLength = "Medium";
  String _selectedComplexity = "B1";
  String _selectedStyle = "Informal";

  final List<String> _topics = [
    "Technology",
    "Science",
    "History",
    "Sports",
    "Art",
  ];
  final List<String> _lengthOptions = ["Short", "Medium", "Long"];
  final List<String> _complexityOptions = ["A1", "A2", "B1", "B2"];
  final List<String> _styleOptions = [
    "Informal",
    "Formal",
    "Academic",
    "Storytelling",
  ];

  @override
  void initState() {
    super.initState();
    _selectedTopic = "Technology";
  }

  @override
  void dispose() {
    _customTopicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildSelectors(),
                  const SizedBox(height: 16),
                  _buildParagraph(),
                ],
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Generar Párrafo"),
      actions: [
        BlocConsumer<CourseContentBloc, CourseContentState>(
          builder: (context, state) {
            final loading =
                state is CourseContentLoading &&
                state.actions == CCActions.generateParagraph;
            return CustomButton(
              onTap: loading ? () {} : () => _handleGenerateParagraph(context),
              child:
                  loading
                      ? LoaderIndicator(
                        spinnerSize: 20,
                        spinnerColor: Colors.blueAccent,
                      )
                      : const Text("Generar"),
            );
          },
          listener: (context, state) {},
        ),
      ],
      leading: IconButton(
        onPressed: () {
          context.read<CourseContentBloc>().add(
            EventUpdateState(CourseContentInitial()),
          );
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  void _handleGenerateParagraph(BuildContext context) {
    String? topicToUse = _selectedTopic;
    if (_showCustomInput && _customTopicController.text.trim().isNotEmpty) {
      topicToUse = _customTopicController.text.trim();
    }

    if (topicToUse == null || topicToUse.isEmpty) {
      ToastMessageUtil.showToast(
        'Elige o ingresa un tema para continuar',
        context,
      );
      return;
    }

    context.read<CourseContentBloc>().add(
      EventGenerateParagraph(
        topic: topicToUse,
        length: _selectedLength,
        complexity: _selectedComplexity,
        style: _selectedStyle,
      ),
    );
  }

  Widget _buildFooter() {
    return BlocBuilder<CourseContentBloc, CourseContentState>(
      builder: (context, state) {
        final isParagraphGenerated = state is CourseContentParagraphGenerated;
        return CustomButton(
          onTap:
              !isParagraphGenerated
                  ? null
                  : () {
                    final ParagraphMetadata paragraphMetadata =
                        ParagraphMetadata(
                          content: state.paragraph,
                          length: _selectedLength,
                          complexity: _selectedComplexity,
                          style: _selectedStyle,
                          courseId: widget.courseid,
                        );
                    context.push(
                      RouteNames.courseContentCreateAiReading,
                      extra: paragraphMetadata,
                    );
                  },
          child: const Text('Continuar'),
        );
      },
    );
  }

  Widget _buildParagraph() {
    return BlocBuilder<CourseContentBloc, CourseContentState>(
      builder: (context, state) {
        if (state is CourseContentLoading &&
            state.actions == CCActions.generateParagraph) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }

        if (state is CourseContentParagraphGenerated) {
          _paragraphController.text = state.paragraph;
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              state.paragraph,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return TextField(
          controller: _paragraphController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Aquí aparecerá el párrafo generado...",
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Selecciona un tópico:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ..._topics.map((topic) {
                final isSelected = _selectedTopic == topic && !_showCustomInput;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(topic),
                    selected: isSelected,
                    selectedColor: Colors.blue.shade200,
                    onSelected: (_) {
                      setState(() {
                        _selectedTopic = topic;
                        _showCustomInput = false;
                        _customTopicController.clear();
                      });
                    },
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, size: 16),
                      SizedBox(width: 4),
                      Text("Otro..."),
                    ],
                  ),
                  selected: _showCustomInput,
                  selectedColor: Colors.green.shade200,
                  onSelected: (_) {
                    setState(() {
                      _showCustomInput = true;
                      _selectedTopic = null;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        if (_showCustomInput) ...[
          const SizedBox(height: 16),
          TextField(
            controller: _customTopicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Ingresa tu tema",
              hintText: "Ej: Inteligencia Artificial en la medicina moderna",
              prefixIcon: Icon(Icons.edit),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSelectors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSelectorRow("Longitud", _lengthOptions, _selectedLength, (val) {
          setState(() => _selectedLength = val);
        }),
        const SizedBox(height: 12),
        _buildSelectorRow(
          "Complejidad",
          _complexityOptions,
          _selectedComplexity,
          (val) {
            setState(() => _selectedComplexity = val);
          },
        ),
        const SizedBox(height: 12),
        _buildSelectorRow("Estilo", _styleOptions, _selectedStyle, (val) {
          setState(() => _selectedStyle = val);
        }),
      ],
    );
  }

  Widget _buildSelectorRow(
    String title,
    List<String> options,
    String selectedOption,
    Function(String) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                options.map((opt) {
                  final isSelected = selectedOption == opt;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(opt),
                      selected: isSelected,
                      selectedColor: Colors.orange.shade200,
                      onSelected: (_) => onSelected(opt),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
