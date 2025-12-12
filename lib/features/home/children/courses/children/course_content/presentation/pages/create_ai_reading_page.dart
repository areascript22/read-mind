import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/paragraph_metadata.dart';
import 'package:client_app/features/home/children/courses/presentation/widgets/buttons/create_button.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/common/utils/date_util.dart';
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

  void _pickDueDateTime() async {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();
    final initialDate = _dueDate?.isBefore(now) ?? true ? now : _dueDate;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate == null) return;
    if (!mounted) return;

    final initialTime =
        _dueDate?.isBefore(now) ?? true
            ? TimeOfDay.now()
            : TimeOfDay.fromDateTime(_dueDate!);

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime == null) return;

    final newDueDate = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      _dueDate = newDueDate;
    });
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
      _pickDueDateTime();
      return;
    }
    final course = context.read<CourseCubit>().state;

    context.read<CourseContentBloc>().add(
      EventCreateAIReading(
        course?.id.toString() ?? '',
        title,
        description,
        widget.paragraphMetadata.content,
        _dueDate!.toUtc().toIso8601String(),
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
              return CreateButton(
                onTap: isLoading ? () {} : () => _saveAiReading(),
                child:
                    isLoading
                        ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                        : const Text(
                          "Guardar",
                          style: TextStyle(color: Colors.white),
                        ),
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
                          ? 'Seleccionar fecha'
                          : DateUtil.formatDateWithTime(
                            _dueDate!.toIso8601String(),
                          ),
                      style: TextStyle(
                        color:
                            _dueDate == null
                                ? Colors.grey.shade600
                                : Colors.black87,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _pickDueDateTime(),
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
