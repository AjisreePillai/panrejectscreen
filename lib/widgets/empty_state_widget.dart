import 'package:flutter/material.dart';

import '../core/app_export.dart';

class EmptyStateWidget extends StatelessWidget {
  final String iconName;
  final String heading;
  final String message;
  final String ctaLabel;
  final VoidCallback onCta;

  const EmptyStateWidget({
    super.key,
    this.iconName = 'description_outlined',
    required this.heading,
    required this.message,
    required this.ctaLabel,
    required this.onCta,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconWidget(
              iconName: iconName,
              color: AppTheme.iconInactive,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              heading,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onCta,
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.orange,
                foregroundColor: AppTheme.textOnPrimary,
              ),
              icon: CustomIconWidget(
                iconName: 'refresh',
                color: AppTheme.textOnPrimary,
                size: 18,
              ),
              label: Text(ctaLabel),
            ),
          ],
        ),
      ),
    );
  }
}
