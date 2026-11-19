import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_bar_widget.dart';
import './widgets/application_details_widget.dart';
import './widgets/credit_report_card_widget.dart';
import './widgets/pan_cta_card_widget.dart';
import './widgets/pan_status_block_widget.dart';

class PanVerificationFailedScreen extends StatefulWidget {
  const PanVerificationFailedScreen({super.key});

  @override
  State<PanVerificationFailedScreen> createState() =>
      _PanVerificationFailedScreenState();
}

class _PanVerificationFailedScreenState
    extends State<PanVerificationFailedScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance;
  final int _attemptsLeft = 1; // TODO: Replace with Riverpod/Bloc state

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  Widget _staggered(int index, Widget child) {
    final start = (index * 0.12).clamp(0.0, 0.6);
    final anim = CurvedAnimation(
      parent: _entrance,
      curve: Interval(
        start,
        (start + 0.4).clamp(0.0, 1.0),
        curve: Curves.easeOutCubic,
      ),
    );
    return FadeTransition(
      opacity: anim,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.04),
          end: Offset.zero,
        ).animate(anim),
        child: child,
      ),
    );
  }

  void _toast(String msg) => Fluttertoast.showToast(msg: msg);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          const AppBarWidget(cartCount: 4),
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _staggered(0, const PanStatusBlockWidget()),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.w, 2.4.h, 4.w, 0),
                          child: _staggered(
                            1,
                            PanCtaCardWidget(
                              attemptsLeft: _attemptsLeft,
                              onReEnter: () => _toast('Opening PAN entry form'),
                              onScan: () => _toast('Opening PAN card scanner'),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 2.8.h),
                          color: AppTheme.surface,
                          padding: EdgeInsets.fromLTRB(4.w, 2.4.h, 4.w, 2.8.h),
                          child: _staggered(
                            2,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'What can you do next',
                                  style: textTheme.titleLarge?.copyWith(
                                    color: AppTheme.textPrimary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 1.8.h),
                                CreditReportCardWidget(
                                  onCheckNow: () => _toast(
                                    'Fetching your free credit report',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.w, 2.4.h, 4.w, 4.h),
                          child: _staggered(
                            3,
                            const ApplicationDetailsWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
