import 'package:client_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomSheetCreateResource extends StatelessWidget {
  final int courseId;
  const BottomSheetCreateResource({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Crear Recurso",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            const SizedBox(height: 16),

            _buildOptionTile(
              context,
              icon: Icons.menu_book_outlined,
              title: "Lectura AI",
              subtitle: "Generar contenido con inteligencia artificial",
              iconColor: Colors.blue,
              svgPath: "assets/images/svg/reading.svg",
              onTap: () {
                Navigator.pop(context);
                context.push(
                  RouteNames.courseContentGenerateParagraph,
                  extra: courseId,
                );
              },
            ),
            const SizedBox(height: 8),

            _buildOptionTile(
              context,
              icon: Icons.menu_book_outlined,
              title: "Flash cards",
              subtitle: "Practica el vocabulario",
              iconColor: Colors.blue,
              svgPath: "assets/images/svg/flashcards.svg",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required VoidCallback onTap,
    required String svgPath,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgPath),
          ),
          title: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
        ),
        const Divider(height: 1, indent: 56),
      ],
    );
  }
}

void showBottomSheetCreateResource(BuildContext context, int courseId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BottomSheetCreateResource(courseId: courseId);
    },
  );
}
