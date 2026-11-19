import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/status_badge_widget.dart';

class PanStatusBlockWidget extends StatelessWidget {
  const PanStatusBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.pinkTop, AppTheme.pinkBottom],
        ),
      ),
      padding: EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
      child: Column(
        children: [
          const StatusBadgeWidget(iconName: 'assignment_outlined'),
          SizedBox(height: 2.6.h),
          Text(
            'PAN Verification Unsuccessful',
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
          SizedBox(height: 1.4.h),
          Text(
            "We couldn't verify your PAN details, as they don't match the "
            'official government records. Due to this, we are unable to '
            'proceed with your application at this time.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: AppTheme.textOnStatusBody,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
