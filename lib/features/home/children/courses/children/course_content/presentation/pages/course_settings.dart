import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/widgets/dialog_remove_course.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/widgets/dialog_unenroll_course.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/course_share_invitecode/share_invitecode_cubit.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/shared/extentions/context/context_clipboard_ext.dart';
import 'package:client_app/shared/widgets/buttons/copy_clipboard_button.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../core/common/utils/toast_util.dart';
import '../widgets/settings_tile.dart';

class CourseSettings extends StatefulWidget {
  final CourseEntity courseEntity;

  const CourseSettings({super.key, required this.courseEntity});

  @override
  State<CourseSettings> createState() => _CourseSettingsState();
}

class _CourseSettingsState extends State<CourseSettings> {
  late CourseEntity courseEntity;
  late AppUserCubit appUserCubit;
  bool isCourseOwner = false;

  @override
  void initState() {
    super.initState();
    courseEntity = widget.courseEntity;
    _initValues();
  }

  void _initValues() {
    appUserCubit = context.read<AppUserCubit>();
    isCourseOwner = widget.courseEntity.teacherId == appUserCubit.user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configuración del curso",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Codigo de invitacion",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Comparte este código con los estudiantes para que se unan a este curso',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildRefreshButton(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade100,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                courseEntity.inviteCode,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            CopyButton(
                              textToCopy: courseEntity.inviteCode,
                              successMessage: "Código de invitación copiado",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                BlocConsumer<ShareInvitecodeCubit, ShareInvitecodeState>(
                  builder: (context, state) {
                    final isLoading = state is ShareInvitecodeLoading;
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon:
                            isLoading
                                ? LoaderIndicator(spinnerSize: 20)
                                : const Icon(Icons.share),
                        label: const Text('Share Invite Code'),
                        onPressed:
                            isLoading
                                ? () {}
                                : () async {
                                  context
                                      .read<ShareInvitecodeCubit>()
                                      .shareInviteCode(courseEntity.inviteCode);
                                },
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is ShareInvitecodefailure) {
                      ToastMessageUtil.showToast(state.message, context);
                    }
                  },
                ),

                SizedBox(height: 20),
                _buildLeaveCourseOption(),
                SizedBox(height: 20),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildAuthorizedOptions(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveCourseOption() {
    final isStudent = appUserCubit.isStudent;
    return !isStudent
        ? SizedBox()
        : BlocConsumer<CoursesBloc, CoursesState>(
          builder: (context, state) {
            final isLoading =
                state is CourseLoading &&
                state.courseAction == CourseAction.unEnroll;
            return SettingsTile(
              icon: isLoading ? LoaderIndicator() : Icon(Icons.logout),
              title: "Abandonar curso",
              onTap:
                  isLoading
                      ? () {}
                      : () async {
                        final result = await showDialogLeaveCourse(
                          context: context,
                        );
                        if (!context.mounted) {
                          return;
                        }

                        if (result) {
                          context.read<CoursesBloc>().add(
                            CoursesUnEnrollEvent(
                              courseId: widget.courseEntity.id,
                            ),
                          );
                        }
                      },
            );
          },
          listener: (context, state) {
            if (state is CourseFailure &&
                state.courseAction == CourseAction.unEnroll) {
              ToastMessageUtil.showToast(state.message, context);
            }

            if (state is CourseUnEnrolledState) {
              ToastMessageUtil.showToast(state.message, context);
              context.read<CoursesBloc>().add(CoursesGetAllEnrolledEvent());
              context.go(RouteNames.home);
            }
          },
        );
  }

  Widget _buildRefreshButton() {
    final build =
        isCourseOwner || appUserCubit.isAdmin || appUserCubit.isSuperUser;
    return !build
        ? SizedBox()
        : BlocConsumer<CoursesBloc, CoursesState>(
          builder: (context, state) {
            final showLoader =
                state is CourseLoading &&
                state.courseAction == CourseAction.updateCode;
            return IconButton(
              icon:
                  showLoader ? LoaderIndicator() : Icon(Icons.refresh_outlined),
              onPressed: () {
                context.read<CoursesBloc>().add(
                  CoursesUpdateInviteCodeEvent(
                    courseId: widget.courseEntity.id,
                  ),
                );
              },
            );
          },
          listener: (context, state) {
            if (state is CourseUpdatedState) {
              setState(() {
                courseEntity = state.courseEntity;
              });
            }
          },
        );
  }

  Widget _buildAuthorizedOptions(BuildContext context) {
    final courseOwner = courseEntity.teacherId == appUserCubit.user?.id;
    final showOptions =
        appUserCubit.isAdmin || appUserCubit.isSuperUser || courseOwner;

    if (!showOptions) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        SettingsTile(
          icon: Icon(Icons.edit),
          title: "Actualizar datos del curso",
          onTap:
              () => context.push(
                RouteNames.courseUpdateInfo,
                extra: courseEntity,
              ),
        ),

        SizedBox(height: 5),
        BlocConsumer<CoursesBloc, CoursesState>(
          builder: (context, state) {
            final showLoader =
                state is CourseLoading &&
                state.courseAction == CourseAction.delete;
            return SettingsTile(
              icon: showLoader ? LoaderIndicator() : Icon(Icons.delete),
              title: "Eliminar curso",
              onTap: () {
                showRemoveDialog(
                  context: context,
                  courseName: widget.courseEntity.name,
                  onConfirm: () {
                    context.read<CoursesBloc>().add(
                      CoursesRemoveEvent(courseId: widget.courseEntity.id),
                    );
                  },
                );
              },
            );
          },
          listener: (context, state) {
            if (state is CourseRemovedState) {
              context.go(RouteNames.home);
              ToastMessageUtil.showToast(
                "Curse ${state.courseEntity.name} fue eliminado",
                context,
              );
            }

            if (state is CourseFailure &&
                state.courseAction == CourseAction.delete) {
              ToastMessageUtil.showToast(state.message, context);
            }
          },
        ),
      ],
    );
  }
}
