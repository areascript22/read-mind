import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfilePage extends StatelessWidget {
  final UserEntity user;

  const UserProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(user.createdAt);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil del Usuario"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar iniciales del usuario
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Text(
                "${user.name[0]}${user.lastName[0]}".toUpperCase(),
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nombre completo
            Text(
              "${user.name} ${user.lastName}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Rol del usuario
            Chip(
              label: Text(
                user
                    .role
                    .name, // asumiendo que tu RoleModel tiene un campo name
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),

            const SizedBox(height: 24),

            // Datos en tarjetas
            _infoTile(Icons.email, "Correo electrónico", user.email),
            _infoTile(Icons.lock, "Hash de contraseña", user.passwordHash),
            _infoTile(Icons.calendar_today, "Creado el", formattedDate),
            _infoTile(Icons.badge, "ID de usuario", user.id.toString()),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
