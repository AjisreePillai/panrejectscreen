import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../core/app_export.dart';

/// Navy brand header: back arrow, search field with camera + mic, cart badge.
class AppBarWidget extends StatelessWidget {
  final String searchHint;
  final int cartCount;
  final VoidCallback? onBack;
  final VoidCallback? onCart;

  const AppBarWidget({
    super.key,
    this.searchHint = 'Search Bajaj Finance',
    this.cartCount = 0,
    this.onBack,
    this.onCart,
  });

  void _handleBack(BuildContext context) {
    if (onBack != null) {
      onBack!();
      return;
    }
    if (context.canPop()) {
      context.pop();
    } else {
      Fluttertoast.showToast(msg: 'You are already at the start');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.navy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(4.w, 1.2.h, 4.w, 1.6.h),
          child: Row(
            children: [
              _HeaderIconButton(
                semanticsLabel: 'Go back',
                onTap: () => _handleBack(context),
                child: CustomIconWidget(
                  iconName: 'arrow_back',
                  color: AppTheme.textOnNavy,
                  size: 24,
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          searchHint,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppTheme.textHint),
                        ),
                      ),
                      CustomIconWidget(
                        iconName: 'photo_camera_outlined',
                        color: AppTheme.iconOnSearch,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      CustomIconWidget(
                        iconName: 'mic_none',
                        color: AppTheme.iconOnSearch,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              _HeaderIconButton(
                semanticsLabel: 'Cart, $cartCount items',
                onTap:
                    onCart ??
                    () => Fluttertoast.showToast(
                      msg: 'Cart has $cartCount items',
                    ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomIconWidget(
                      iconName: 'shopping_cart_outlined',
                      color: AppTheme.textOnNavy,
                      size: 24,
                    ),
                    if (cartCount > 0)
                      Positioned(
                        right: -8,
                        top: -8,
                        child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.orange,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                              color: AppTheme.navy,
                              width: 1.5,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$cartCount',
                            style: const TextStyle(
                              color: AppTheme.textOnPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              height: 1.1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final String semanticsLabel;

  const _HeaderIconButton({
    required this.child,
    required this.onTap,
    required this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticsLabel,
      child: InkResponse(
        onTap: onTap,
        radius: 24,
        splashColor: AppTheme.textOnNavy.withAlpha(46),
        child: SizedBox(width: 40, height: 44, child: Center(child: child)),
      ),
    );
  }
}
