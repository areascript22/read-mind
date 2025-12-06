import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconBackground;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        elevation: 0.5,
        shadowColor: colorScheme.shadow.withValues(alpha: 0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: colorScheme.primary.withValues(alpha: 0.1),
          highlightColor: colorScheme.primary.withValues(alpha: 0.05),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color:
                        iconBackground ??
                        colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        iconBackground == null
                            ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                colorScheme.primary.withValues(alpha: 0.15),
                                colorScheme.primary.withValues(alpha: 0.05),
                              ],
                            )
                            : null,
                  ),
                  child: Center(
                    child: IconTheme(
                      data: IconThemeData(
                        color:
                            iconBackground != null
                                ? Colors.white
                                : colorScheme.primary,
                        size: 20,
                      ),
                      child: icon,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),

                Icon(
                  Icons.chevron_right_rounded,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
