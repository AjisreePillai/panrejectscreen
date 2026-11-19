import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_theme.dart';

class PanCtaCardWidget extends StatelessWidget {
  final VoidCallback onReEnter;
  final VoidCallback onScan;
  final int attemptsLeft;

  const PanCtaCardWidget({
    super.key,
    required this.onReEnter,
    required this.onScan,
    this.attemptsLeft = 1,
  });

  @override
  Widget build(BuildContext context) {
    final attemptText = attemptsLeft == 1
        ? 'You have 1 attempt only.'
        : 'You have $attemptsLeft attempts left.';
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.yellowCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.borderOrange, width: 1),
      ),
      padding: EdgeInsets.fromLTRB(4.5.w, 2.6.h, 4.5.w, 2.2.h),
      child: Column(
        children: [
          _PrimaryPillButton(label: 'RE-ENTER PAN DETAILS', onTap: onReEnter),
          SizedBox(height: 1.6.h),
          _OutlinedPillButton(label: 'SCAN YOUR PAN CARD', onTap: onScan),
          SizedBox(height: 1.6.h),
          Text(
            attemptText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PressScale extends StatefulWidget {
  final Widget Function(bool pressed) builder;
  final VoidCallback onTap;
  const _PressScale({required this.builder, required this.onTap});

  @override
  State<_PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<_PressScale> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        child: widget.builder(_pressed),
      ),
    );
  }
}

class _PrimaryPillButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryPillButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: _PressScale(
        onTap: onTap,
        builder: (_) => Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [AppTheme.orange, AppTheme.orangeLight],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.orange.withAlpha(77),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: AppTheme.textOnPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlinedPillButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlinedPillButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: _PressScale(
        onTap: onTap,
        builder: (_) => Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.orange, width: 1.5),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: AppTheme.orangeText,
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
