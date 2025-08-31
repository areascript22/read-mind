import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/common/utils/toast_util.dart';

class NoPermissionDialog extends StatefulWidget {
  const NoPermissionDialog({super.key});

  @override
  State<NoPermissionDialog> createState() => _NoPermissionDialogState();
}

class _NoPermissionDialogState extends State<NoPermissionDialog> {
  bool _acceptedPolicies = false;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text("No tiene permisos"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "No cuenta con los permisos necesario para la gestión de cursos",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _acceptedPolicies,
                onChanged: (value) {
                  setState(() {
                    _acceptedPolicies = value ?? false;
                  });
                },
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Optionally handle viewing policy details
                  },
                  child: const Text(
                    "Acepto la Política de Privacidad y los Términos y Condiciones",
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        CustomButton (
          onTap: () async {
            if (!_acceptedPolicies) {
              ToastMessageUtil.showToast(
                "Acepta los terminos para solicitar permisos",
                context,
              );
              return;
            }
          },
          child: Text("Solicitar permisos"),
        ),
      ],
    );
  }
}

void showNoPermissionsDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder:
        (context) => NoPermissionDialog(),
  );
}
