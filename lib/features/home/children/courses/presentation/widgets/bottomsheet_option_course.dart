import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/course_share_invitecode/share_invitecode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetOptionsCourse extends StatelessWidget {
  final CourseEntity course;

  const BottomSheetOptionsCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opciones del curso',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              course.name,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            _buildShareInviteCodeButton(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: const Text('Archivar'),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  BlocConsumer<ShareInvitecodeCubit, ShareInvitecodeState>
  _buildShareInviteCodeButton() {
    return BlocConsumer<ShareInvitecodeCubit, ShareInvitecodeState>(
      builder: (context, state) {
        final isLoading = state is ShareInvitecodeLoading;
        return ListTile(
          leading: const Icon(Icons.share),
          title: const Text('Compartir vínculo de invitación'),
          onTap:
              isLoading
                  ? () {}
                  : () {
                    context.read<ShareInvitecodeCubit>().shareInviteCode(
                      course.inviteCode,
                    );
                  },
        );
      },
      listener: (context, state) {
        if (state is ShareInvitecodefailure) {
          Navigator.pop(context);
          ToastMessageUtil.showToast(state.message, context);
        }
      },
    );
  }
}

void showBottomSheetOptionsCourse(BuildContext context, CourseEntity course) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (_) => BottomSheetOptionsCourse(course: course),
  );
}
