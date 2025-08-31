import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  final String role;

  const RoleCard({super.key, required this.role});

  Color _getCardColor(String role) {
    switch (role.toLowerCase()) {
      case 'student':
        return Colors.blue.shade200;
      case 'professor':
        return Colors.green.shade100;
      case 'admin':
        return Colors.red.shade100;
      case 'superuser':
        return Colors.purple.shade100;
      default:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getCardColor(role),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Center(
          child: Text(
            role,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
