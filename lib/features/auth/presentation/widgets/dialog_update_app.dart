import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showUpdateAppDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const _UpdateAppDialog(),
  );
}

class _UpdateAppDialog extends StatelessWidget {
  const _UpdateAppDialog({super.key});

  Future<void> _redirectToPlayStore(BuildContext context) async {
    try {
      const String flavor = String.fromEnvironment("FLAVOR");
      final url =
          (flavor == "dev")
              ? "https://play.google.com/store/apps/details?id=com.readmind.dev"
              : "https://play.google.com/store/apps/details?id=com.readmind.ai";

      final uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 24,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon with gradient background
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade400, Colors.blue.shade600],
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.system_update_alt_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Actualización requerida",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Message container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Column(
                  children: [
                    Text(
                      "Ya está disponible una nueva versión de la aplicación.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF666666),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Actualice para continuar usando la aplicación.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF666666),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Update button with subtle animation
              SizedBox(
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    onTap: () => _redirectToPlayStore(context),
                    borderRadius: BorderRadius.circular(14),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.blue.shade500, Colors.blue.shade600],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade300.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.download_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Actualizar ahora",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Optional: Add a subtle version info
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  "Versión más reciente disponible",
                  style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
