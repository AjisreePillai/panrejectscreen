import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// White circular badge with a neutral navy icon, used in status blocks.
class StatusBadgeWidget extends StatelessWidget {
  final String iconName;
  final double size;

  const StatusBadgeWidget({
    super.key,
    this.iconName = 'assignment_outlined',
    this.size = 84,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppTheme.navy.withAlpha(26),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: CustomIconWidget(
        iconName: iconName,
        color: AppTheme.navy,
        size: size * 0.46,
      ),
    );
  }
}
