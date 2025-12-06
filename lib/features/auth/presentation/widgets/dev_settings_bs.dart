import 'package:client_app/core/constants/app_environment.dart';
import 'package:flutter/material.dart';

void showDevSettingBS(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const DevSettingBottomSheet(),
  );
}

// StatefulWidget for the BottomSheet body
class DevSettingBottomSheet extends StatefulWidget {
  const DevSettingBottomSheet({super.key});

  @override
  State<DevSettingBottomSheet> createState() => _DevSettingBottomSheetState();
}

class _DevSettingBottomSheetState extends State<DevSettingBottomSheet> {
  final TextEditingController _lanController = TextEditingController();
  // final TextEditingController _wifiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lanController.text = AppEnvironment().baseUrl;
    // _wifiController.text = Environments.testHostWIFI;
  }

  @override
  void dispose() {
    _lanController.dispose();
    // _wifiController.dispose();
    super.dispose();
  }

  void _guardarSettings() {
    Navigator.of(context).pop(); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TextField(
          //   controller: _lanController,
          //   decoration: const InputDecoration(
          //     labelText: 'LAN Network',
          //     border: OutlineInputBorder(),
          //   ),
          // ),
          const SizedBox(height: 16),
          TextField(
            controller: _lanController,
            decoration: const InputDecoration(
              labelText: 'WiFi Network',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _guardarSettings,
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
