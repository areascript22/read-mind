import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key, this.textStyle});

  final TextStyle? textStyle;

  Future<String> _getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return 'Version ${info.version} (${info.buildNumber})';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getAppVersion(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        if (snapshot.hasError) {
          return  SizedBox.shrink();
        }
        return Text(snapshot.data ?? '', style: textStyle);
      },
    );
  }
}
