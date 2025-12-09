import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/aireading_update_params_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/bloc/ai_reading_bloc/ai_reading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../presentation/widgets/buttons/create_button.dart';
import '../../../../../../presentation/widgets/course_textfield.dart';

class UpdateAiReadingParamsPage extends StatefulWidget {
  final AiReadingUpdateParamsEntity aiReadingUpdateParams;

  const UpdateAiReadingParamsPage({
    super.key,
    required this.aiReadingUpdateParams,
  });

  @override
  State<UpdateAiReadingParamsPage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<UpdateAiReadingParamsPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
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

    context.read<AiReadingBloc>().add(
      AiReadingUpdateParams(
        activityId: widget.aiReadingUpdateParams.activityId,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        dueDate: _dueDate,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initTextControllers();
  }

  void _initTextControllers() {
    _dueDate = widget.aiReadingUpdateParams.aiReadingEntity.dueDate;
    titleController.text = widget.aiReadingUpdateParams.aiReadingEntity.title;
    descriptionController.text =
        widget.aiReadingUpdateParams.aiReadingEntity.description;
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
                child: BlocConsumer<AiReadingBloc, AiReadingState>(
                  listener: (context, state) {
                    if (state is AiReadingParamsUpdated) {
                      Navigator.pop(context);
                      ToastMessageUtil.showToast("Datos actualizados", context);
                    }

                    if (state is AiReadingError &&
                        state.actionType ==
                            AiActionType.aiReadingUpdateParams) {
                      ToastMessageUtil.showToast(state.message, context);
                    }
                  },
                  builder: (context, state) {
                    return CreateButton(
                      onTap: _validateFields,
                      child:
                          state is AiReadingLoading
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
              const SizedBox(height: 20),
              Text(
                "Fecha de entrega",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _dueDate == null
                          ? "Sin fecha de entrega"
                          : "Entrega: ${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickDueDate,
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
