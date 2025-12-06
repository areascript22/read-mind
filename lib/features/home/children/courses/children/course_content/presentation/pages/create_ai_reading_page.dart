import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/paragraph_metadata.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/course_content/course_content_bloc.dart';
import '../cubit/course_cubit.dart';

class CreateAiReadingPage extends StatefulWidget {
  final ParagraphMetadata paragraphMetadata;
  const CreateAiReadingPage({super.key, required this.paragraphMetadata});

  @override
  State<CreateAiReadingPage> createState() => _CreateAiReadingPageState();
}

class _CreateAiReadingPageState extends State<CreateAiReadingPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _titleFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  DateTime? _dueDate;

  void _pickDueDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  void _saveAiReading() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) {
      ToastMessageUtil.showToast('El título es requerido', context);
      _titleFocus.requestFocus();
      return;
    }

    if (description.isEmpty) {
      ToastMessageUtil.showToast('La descripción es requerido', context);
      _descriptionFocus.requestFocus();
      return;
    }

    if (_dueDate == null) {
      ToastMessageUtil.showToast(
        'Debes seleccionar una fecha de entrega',
        context,
      );
      _pickDueDate();
      return;
    }
    final course = context.read<CourseCubit>().state;

    context.read<CourseContentBloc>().add(
      EventCreateAIReading(
        course?.id.toString() ?? '',
        title,
        description,
        widget.paragraphMetadata.content,
        _dueDate!.toIso8601String(),
        widget.paragraphMetadata.length,
        widget.paragraphMetadata.complexity,
        widget.paragraphMetadata.style,
      ),
    );
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Lectura IA"),
        actions: [
          BlocConsumer<CourseContentBloc, CourseContentState>(
            builder: (context, state) {
              final isLoading =
                  state is CourseContentLoading &&
                  state.actions == CCActions.createAiReading;
              return CustomButton(
                onTap: isLoading ? () {} : () => _saveAiReading(),
                child:
                    isLoading
                        ? LoaderIndicator(
                          spinnerSize: 20,
                          spinnerColor: Colors.blueAccent,
                        )
                        : const Text("Guardar"),
              );
            },
            listener: (context, state) {
              if (state is CourseContentError &&
                  state.actions == CCActions.createAiReading) {
                ToastMessageUtil.showToast(state.message, context);
              }
              if (state is CourseContentAiReadingCreated) {
                ToastMessageUtil.showToast('Actividad creada', context);
                Navigator.pop(context);
                Navigator.pop(context);
                context.read<CourseContentBloc>().add(
                  EventGetAllActivities(
                    widget.paragraphMetadata.courseId.toString(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Título", style: Theme.of(context).textTheme.titleMedium),
              TextField(
                controller: _titleController,
                focusNode: _titleFocus,
                decoration: const InputDecoration(
                  hintText: "Escribe el título de la actividad",
                ),
              ),
              const SizedBox(height: 16),

              Text(
                "Descripción",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextField(
                controller: _descriptionController,
                focusNode: _descriptionFocus,
                decoration: const InputDecoration(
                  hintText: "Escribe una breve descripción",
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      _dueDate == null
                          ? "Sin fecha de entrega"
                          : "Entrega: ${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickDueDate,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text("Fecha entrega"),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.paragraphMetadata.content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
