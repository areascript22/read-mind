import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../presentation/widgets/buttons/create_button.dart';
import '../../../../presentation/widgets/course_textfield.dart';

class UpdateCourseInfoPage extends StatefulWidget {
  final CourseEntity courseEntity;

  const UpdateCourseInfoPage({super.key, required this.courseEntity});

  @override
  State<UpdateCourseInfoPage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<UpdateCourseInfoPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();

  void _validateFields() {
    if (titleController.text.isEmpty) {
      titleFocusNode.requestFocus();
      SystemChannels.textInput.invokeMethod('TextInput.show');
      ToastMessageUtil.showToast("El título es obligatorio", context);
      return;
    }
    if (descriptionController.text.isEmpty) {
      descriptionFocusNode.requestFocus();
      SystemChannels.textInput.invokeMethod('TextInput.show');
      ToastMessageUtil.showToast("La descripción es obligatorio", context);
      return;
    }
    context.read<CoursesBloc>().add(
      CoursesUpdateInfoEvent(
        courseId: widget.courseEntity.id.toString(),
        name: titleController.text.trim(),
        description: descriptionController.text.trim(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    titleController.text = widget.courseEntity.name;
    descriptionController.text = widget.courseEntity.description;
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
            title: const Text("Actualizar curso"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: BlocConsumer<CoursesBloc, CoursesState>(
                  listener: (context, state) {
                    if (state is CourseUpdatedState) {
                      Navigator.pop(context);
                      ToastMessageUtil.showToast("Datos actualizados", context);
                    }

                    if (state is CourseFailure &&
                        state.courseAction == CourseAction.updateInfo) {
                      ToastMessageUtil.showToast(state.message, context);
                    }
                  },
                  builder: (context, state) {
                    return CreateButton(
                      onTap: _validateFields,
                      child:
                          state is CourseLoading
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
                                style: TextStyle(color: Colors.blue),
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
            children: [
              CourseTextField(
                hintText: "Nombre del curso (obligatorio)",
                controller: titleController,
                focusNode: titleFocusNode,
              ),
              const SizedBox(height: 10),
              CourseTextField(
                hintText: "Descripción (obligatorio)",
                controller: descriptionController,
                focusNode: descriptionFocusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
