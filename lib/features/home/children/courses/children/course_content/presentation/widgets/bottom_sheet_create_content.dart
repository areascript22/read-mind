import 'package:client_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetCreateResource extends StatelessWidget {
  const BottomSheetCreateResource({super.key});

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
            // Header con título y divisor
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

            // Opción Lectura AI
            _buildOptionTile(
              context,
              icon: Icons.menu_book_outlined,
              title: "Lectura AI",
              subtitle: "Generar contenido con inteligencia artificial",
              iconColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                context.push(RouteNames.courseContentGenerateParagraph);
              },
            ),

            _buildOptionTile(
              context,
              icon: Icons.assignment_turned_in,
              title: "Cuestionario",
              subtitle: "Crear preguntas y respuestas",
              iconColor: Colors.green,
              onTap: () {
                // Agregar la funcionalidad aquí
              },
            ),

            // Opción Anuncio
            _buildOptionTile(
              context,
              icon: Icons.announcement_outlined,
              title: "Anuncio",
              subtitle: "Compartir información importante",
              iconColor: Colors.orange,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/create_content');
              },
            ),

            // Opción Material
            _buildOptionTile(
              context,
              icon: Icons.insert_drive_file_outlined,
              title: "Material",
              subtitle: "Subir documentos y archivos",
              iconColor: Colors.purple,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/create_content');
              },
            ),

            const SizedBox(height: 8),
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
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
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
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
        ),
        const Divider(height: 1, indent: 56),
      ],
    );
  }
}

void showBottomSheetCreateResource(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const BottomSheetCreateResource();
    },
  );
}
