import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/course_content/course_content_bloc.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class GenerateParagraphPage extends StatefulWidget {
  const GenerateParagraphPage({super.key});

  @override
  State<GenerateParagraphPage> createState() => _GenerateParagraphPageState();
}

class _GenerateParagraphPageState extends State<GenerateParagraphPage> {
  final TextEditingController _paragraphController = TextEditingController();
  final TextEditingController _customTopicController = TextEditingController();
  String? _selectedTopic;
  bool _showCustomInput = false;

  final List<String> _topics = [
    "Technology",
    "Science",
    "History",
    "Sports",
    "Art",
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
          children: [_buildHeader(), _buildParagraph(), _buildFooter()],
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
              color: Theme.of(context).colorScheme.secondary,
              onTap:
                  loading
                      ? () {}
                      : () {
                        _handleGenerateParagraph(context);
                      },
              child:
                  loading
                      ? LoaderIndicator(spinnerSize: 20)
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

    context.read<CourseContentBloc>().add(EventGenerateParagraph(topicToUse));
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
                    context.push(
                      RouteNames.courseContentCreateAiReading,
                      extra: state.paragraph,
                    );
                  },
          child: const Text('Continuar'),
        );
      },
    );
  }

  Widget _buildParagraph() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<CourseContentBloc, CourseContentState>(
            builder: (context, state) {
              if (state is CourseContentLoading &&
                  state.actions == CCActions.generateParagraph) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
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
          ),
        ],
      ),
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
              // Chips de temas predefinidos
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
              }).toList(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, size: 16),
                      const SizedBox(width: 4),
                      const Text("Otro..."),
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
            onChanged: (_) {
              setState(() {}); // Para actualizar validaciones en tiempo real
            },
          ),
        ],

        const SizedBox(height: 24),
      ],
    );
  }
}
