import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/common/widget/custom_outlined_button.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flash_card_creation/flashcard_creation_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/cubit/course_cubit.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../presentation/bloc/course_content/course_content_bloc.dart';

Future<bool?> showDeleteActivityAlertFlashCard({
  required BuildContext context,
  required int activityId,
}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: serviceLocator<FlashcardCreationCubit>()),
          BlocProvider.value(value: serviceLocator<CourseContentBloc>()),
          BlocProvider.value(value: serviceLocator<CourseCubit>()),
        ],
        child: DeleteActivityAlertDialog(activityId: activityId),
      );
    },
  );
}

class DeleteActivityAlertDialog extends StatelessWidget {
  final int activityId;

  const DeleteActivityAlertDialog({super.key, required this.activityId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange[700],
            size: 28,
          ),
          const SizedBox(width: 12),
          const Text(
            'Eliminar Actividad',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Text(
            '¿Estás seguro de que deseas eliminar esta actividad de Flash Cards?',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Se eliminarán permanentemente:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(height: 8),
                _DeleteItem(text: '• Intentos de traducción.'),
                _DeleteItem(text: '• Progresos de estudiantes.'),
                _DeleteItem(text: '• Calificaciónes de estudiantes.'),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onTap: () => Navigator.of(context).pop(false),
                  child: const Text('Cancelar', style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(width: 10),

              BlocConsumer<FlashcardCreationCubit, FlashcardCreationState>(
                builder: (context, state) {
                  final loading = state is FlashcardCreationLoading;

                  return Expanded(
                    child: CustomButton(
                      color: Colors.red,
                      onTap:
                          loading
                              ? () {}
                              : () {
                                context
                                    .read<FlashcardCreationCubit>()
                                    .deleteFlashCardActivity(
                                      activityId: activityId,
                                    );
                              },
                      child:
                          loading
                              ? LoaderIndicator()
                              : const Text(
                                'Eliminar',
                                style: TextStyle(fontSize: 15),
                              ),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is FlashcardCreationDeleted) {
                    ToastMessageUtil.showToast(
                      "Actividad eliminada....",
                      context,
                    );
                    final course = context.read<CourseCubit>().state;

                    Navigator.of(context).pop(true);
                    if (course != null) {
                      context.read<CourseContentBloc>().add(
                        EventGetAllActivities(course.id.toString()),
                      );
                    }
                  }

                  if (state is FlashcardCreationError) {
                    ToastMessageUtil.showToast(state.message, context);
                    Navigator.of(context).pop(false);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DeleteItem extends StatelessWidget {
  final String text;

  const _DeleteItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13.5, color: Colors.grey),
      ),
    );
  }
}
