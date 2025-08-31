import 'package:flutter/material.dart';
class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          const SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "LinguaLearn",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              //.RoleCard(role: sharedVM.user?.role.name ?? ""),
            ],
          ),
          const Divider(),
          //OPTIONS
          _buildOption(title: "Clases", icon: Icons.house_outlined, index: 0),
          _buildOption(
            title: "Calendario",
            icon: Icons.calendar_month_outlined,
            index: 1,
          ),
          _buildOption(
            title: "Notificaciónes",
            icon: Icons.notifications_active_outlined,
            index: 2,
          ),
          const Padding(padding: EdgeInsets.only(left: 40), child: Divider()),
          _buildOption(
            title: "Archivos sin conexión",
            icon: Icons.check_circle_outline,
            index: 3,
          ),
          _buildOption(
            title: "Clases archivadas",
            icon: Icons.download_done_outlined,
            index: 4,
          ),
          _buildOption(
            title: "Configuración",
            icon: Icons.settings_outlined,
            index: 5,
          ),
          Divider(),

            _buildOption(
              title: "Administrador",
              icon: Icons.help_outline_outlined,
              index: 6,
            ),
        ],
      ),
    );
  }

  //
  Widget _buildOption({
    required String title,
    required IconData icon,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color:  Colors.blue.withValues (alpha:  0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListTile(
        onTap: () {
          if (index == 0) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushReplacementNamed('/course_feature');
          }

          if (index == 6) {
            Navigator.pop(context);
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushReplacementNamed('/admin_feature');
          }
          },
        title: Text(
          title,
          style: TextStyle(color: Colors.blue),
        ),
        leading: Icon(icon, color: Colors.blue),
      ),
    );
  }
}
