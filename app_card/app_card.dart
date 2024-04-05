import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_ui/common/extensions/iterable_join_with.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.body,
    required this.onCardPressed,
    this.header,
    this.actions,
    this.padding,
    this.additionalStatistics,
    this.spacing,
  });

  final Widget body;
  final Widget? header;
  final Widget? actions;

  final Widget? additionalStatistics;

  final VoidCallback onCardPressed;
  final EdgeInsets? padding;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final actions = this.actions;
    final header = this.header;
    final additionalStatistics = this.additionalStatistics;

    return GestureDetector(
      onTap: onCardPressed,
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: 24.w).copyWith(
                top: 16.h,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (header != null) header,
              body,
              if (actions != null && additionalStatistics != null)
                Column(
                  children: [
                    additionalStatistics,
                    actions,
                  ],
                )
              else if (actions != null)
                actions
              else if (additionalStatistics != null)
                additionalStatistics
            ].separateWith(SizedBox(height: spacing ?? 16.h)),
          ),
        ),
      ),
    );
  }
}
