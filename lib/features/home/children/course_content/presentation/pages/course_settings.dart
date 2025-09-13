import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/common/utils/toast_util.dart';

class CourseSettings extends StatefulWidget {
  const CourseSettings({super.key});

  @override
  State<CourseSettings> createState() => _CourseSettingsState();
}

class _CourseSettingsState extends State<CourseSettings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configuración del curso",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:
     true
          ? Column(
        children: [
          //Invite code
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Código de invitació al curso',
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Comparte este código con los estudiantes para que se unan a este curso',
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                         "codigo de invitacion"   ,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.content_copy, size: 22),
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: "invite code"),
                          );
                          if (context.mounted) {
                            ToastMessageUtil.showToast(
                              "Código de invitación copiado",
                              context,
                            );
                          }
                        },
                        tooltip: 'Copiar a la papelera',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.share),
                    label: const Text('Share Invite Code'),
                    onPressed: () async {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
        ],
      )
          : Center(
        child: Column(
          children: [Text("No se encontró los datos del curso")],
        ),
      ),
    );
  }
}
