import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// Collapsible "Application Details" row, collapsed by default.
class ApplicationDetailsWidget extends StatefulWidget {
  const ApplicationDetailsWidget({super.key});

  @override
  State<ApplicationDetailsWidget> createState() =>
      _ApplicationDetailsWidgetState();
}

class _ApplicationDetailsWidgetState extends State<ApplicationDetailsWidget> {
  bool _expanded = false;

  // Mock application data (dates relative to current timestamp: 27 Oct 2026)
  static const List<MapEntry<String, String>> _rows = [
    MapEntry('Application ID', 'BFL-PL-2610-884217'),
    MapEntry('Product', 'Personal Loan'),
    MapEntry('Applied on', '27 Oct 2026'),
    MapEntry('Applicant', 'Rohan M. Kulkarni'),
    MapEntry('PAN (masked)', 'ABCXX4821K'),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.hairline),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            splashColor: AppTheme.orange.withAlpha(26),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Application Details',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    child: CustomIconWidget(
                      iconName: 'keyboard_arrow_down',
                      color: AppTheme.textPrimary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _expanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                    child: Column(
                      children: [
                        const Divider(height: 1, color: AppTheme.hairline),
                        const SizedBox(height: 8),
                        for (final r in _rows)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  r.key,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                Text(
                                  r.value,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: AppTheme.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}
