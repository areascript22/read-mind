import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../widgets/textfield_code_course.dart';

class EnrollCourse extends StatefulWidget {
  const EnrollCourse({super.key});

  @override
  State<EnrollCourse> createState() => _EnrollCourseState();
}

class _EnrollCourseState extends State<EnrollCourse> {
  final codeTextController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    codeTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close_rounded),
        ),
        title: const Text(
          "Unirse a un curso",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección de perfil de usuario
              _buildProfileSection(theme, colorScheme),

              const SizedBox(height: 24),

              // Campo de código
              _buildCodeSection(theme, colorScheme),

              const SizedBox(height: 24),

              // Botón de unirse
              _buildJoinButton(),

              const SizedBox(height: 32),

              // Sección de indicaciones
              _buildIndicationsSection(theme, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Accederás como",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<AppUserCubit, AppUserState>(
          builder: (context, state) {
            if (state is AppUserLoggedIn) {
              final user = state.userEntity;
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outline.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          user.name.substring(0, 2).toUpperCase(),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            user.email,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildCodeSection(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Código de invitación",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Pídele al propietario del curso el código de invitación e ingrésalo aquí.",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        TextFieldCodeCourse(
          label: "Ingresa el código del curso",
          textEditingController: codeTextController,
        ),
      ],
    );
  }

  Widget _buildJoinButton() {
    return BlocConsumer<CoursesBloc, CoursesState>(
      builder: (context, state) {
        final isLoading =
            state is CourseLoading && state.courseAction == CourseAction.enroll;

        return CustomButton(
          onTap: isLoading ? null : _handleJoinCourse,
          child:
              isLoading
                  ? LoaderIndicator(spinnerColor: Colors.white)
                  : Text(
                    "Unirse al curso",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
        );
      },
      listener: (context, state) {
        if (state is CourseFailure &&
            state.courseAction == CourseAction.enroll) {
          ToastMessageUtil.showToast(state.message, context);
        }

        if (state is CourseEnrolledState) {
          ToastMessageUtil.showToast(state.message, context);
          context.read<CoursesBloc>().add(CoursesGetAllEnrolledEvent());
          if (mounted) Navigator.pop(context);
        }
      },
    );
  }

  Widget _buildIndicationsSection(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indicaciones importantes",
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint("Usa una cuenta autorizada", theme, colorScheme),
          const SizedBox(height: 8),
          _buildBulletPoint(
            "El código debe tener entre 6 y 8 caracteres (letras o números)",
            theme,
            colorScheme,
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(
            "No incluye espacios ni símbolos especiales",
            theme,
            colorScheme,
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              children: [
                const TextSpan(text: "¿Problemas para unirte? Visita el "),
                TextSpan(
                  text: "Centro de ayuda",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar al centro de ayuda
                        },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(
    String text,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, right: 8),
          child: Icon(Icons.circle, size: 6, color: colorScheme.primary),
        ),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  void _handleJoinCourse() {
    if (codeTextController.text.trim().isEmpty) {
      ToastMessageUtil.showToast("Ingresa el código de invitación", context);
      return;
    }

    // Ocultar teclado
    FocusScope.of(context).unfocus();

    context.read<CoursesBloc>().add(
      CoursesEnrollEvent(inviteCode: codeTextController.text.trim()),
    );
  }
}
