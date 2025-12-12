import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_update_params.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flash_card_creation/flashcard_creation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../../core/common/utils/date_util.dart';
import '../../../../../../presentation/widgets/buttons/create_button.dart';
import '../../../../../../presentation/widgets/course_textfield.dart';
import '../../../../presentation/bloc/course_content/course_content_bloc.dart';

class UpdateFlashCardParamsPage extends StatefulWidget {
  final FlashCardUpdateParamsEntity flashCardUpdateParams;

  const UpdateFlashCardParamsPage({
    super.key,
    required this.flashCardUpdateParams,
  });

  @override
  State<UpdateFlashCardParamsPage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<UpdateFlashCardParamsPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final maxCardsController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final maxCardsFocusNode = FocusNode();
  late DateTime _dueDate;

  void _validateFields() {
    if (titleController.text.trim().isEmpty) {
      titleFocusNode.requestFocus();
      SystemChannels.textInput.invokeMethod('TextInput.show');
      ToastMessageUtil.showToast("El título es obligatorio", context);
      return;
    }
    if (descriptionController.text.trim().isEmpty) {
      descriptionFocusNode.requestFocus();
      SystemChannels.textInput.invokeMethod('TextInput.show');
      ToastMessageUtil.showToast("La descripción es obligatorio", context);
      return;
    }

    if (maxCardsController.text.trim().isEmpty) {
      maxCardsFocusNode.requestFocus();
      SystemChannels.textInput.invokeMethod('TextInput.show');
      ToastMessageUtil.showToast("Ingresa un valor (Max cards)", context);
      return;
    }

    context.read<FlashcardCreationCubit>().updateFlashCardActivity(
      activityId: widget.flashCardUpdateParams.activityId,
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      dueDate: _dueDate,
      maxCards: int.parse(maxCardsController.text),
    );
  }

  @override
  void initState() {
    super.initState();
    _initTextControllers();
  }

  void _initTextControllers() {
    _dueDate = widget.flashCardUpdateParams.flashCardentity.dueDate;
    titleController.text = widget.flashCardUpdateParams.flashCardentity.title;
    descriptionController.text =
        widget.flashCardUpdateParams.flashCardentity.description;
    maxCardsController.text =
        widget.flashCardUpdateParams.flashCardentity.maxCards.toString();
  }

  void _pickDueDate() async {
    FocusScope.of(context).unfocus();
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

  void _pickDueDateTime() async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();
    final initialDate = _dueDate.isBefore(now) ? now : _dueDate;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate == null) return;
    if (!mounted) return;

    final initialTime =
        _dueDate.isBefore(now)
            ? TimeOfDay.now()
            : TimeOfDay.fromDateTime(_dueDate);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.inversePrimary.withValues(alpha: 0.2),
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            title: const Text("Actualizar actividad"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: BlocConsumer<
                  FlashcardCreationCubit,
                  FlashcardCreationState
                >(
                  listener: (context, state) {
                    if (state is FlashcardCreationUpdated) {
                      Navigator.pop(context);
                      ToastMessageUtil.showToast("Datos actualizados", context);
                      context.read<CourseContentBloc>().add(
                        EventGetAllActivities(
                          widget.flashCardUpdateParams.courseId.toString(),
                        ),
                      );
                    }

                    if (state is FlashcardCreationError) {
                      ToastMessageUtil.showToast(state.message, context);
                    }
                  },
                  builder: (context, state) {
                    return CreateButton(
                      onTap: _validateFields,
                      child:
                          state is FlashcardCreationLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blue,
                                  ),
                                ),
                              )
                              : const Text(
                                'Actualizar',
                                style: TextStyle(color: Colors.white),
                              ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseTextField(
                hintText: "Título",
                controller: titleController,
                focusNode: titleFocusNode,
              ),
              const SizedBox(height: 10),
              CourseTextField(
                hintText: "Descripción (obligatorio)",
                controller: descriptionController,
                focusNode: descriptionFocusNode,
              ),

              const SizedBox(height: 10),
              CourseTextField(
                hintText: "Max cards (obligatorio)",
                controller: maxCardsController,
                focusNode: maxCardsFocusNode,
                textInputType: TextInputType.number,
              ),

              const SizedBox(height: 20),
              Text(
                "Fecha de entrega",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      DateUtil.formatDateWithTime(_dueDate.toIso8601String()),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickDueDateTime,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text("Fecha entrega"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
