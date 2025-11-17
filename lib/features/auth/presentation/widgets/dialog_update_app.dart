import 'package:flutter/material.dart';

/// PUBLIC METHOD — call this from anywhere
Future<void> showUpdateAppDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // prevent closing the dialog
    builder: (context) => const _UpdateAppDialog(),
  );
}

/// UPDATE APP DIALOG WIDGET
class _UpdateAppDialog extends StatelessWidget {
  const _UpdateAppDialog({super.key});

  Future<void> _redirectToPlayStore() async {
    const url =
        "https://play.google.com/store/apps/details?id=YOUR_PLAY_STORE_URL"; // TODO: replace

    final uri = Uri.parse(url);

    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri, mode: LaunchMode.externalApplication);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.system_update, size: 70, color: Colors.blueAccent),
            const SizedBox(height: 15),

            const Text(
              "Update Required",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "A new version of the app is available.\n"
              "Please update to continue using the application.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            // Update button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _redirectToPlayStore,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Update Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
