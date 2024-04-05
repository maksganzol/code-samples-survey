import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';

class AdditionalActionsMenu extends StatelessWidget {
  const AdditionalActionsMenu({
    super.key,
    required this.destructiveActions,
    required this.additionalActions,
  });

  final List<(VoidCallback, String)> destructiveActions;
  final List<(VoidCallback, String, Widget)> additionalActions;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);

    return Center(
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: palette.neutralsWhite,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...additionalActions.map(
                  (item) {
                    final (onPressed, label, icon) = item;
                    return InkWell(
                      onTap: () {
                        context.pop();
                        onPressed();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Row(
                          children: [
                            icon,
                            8.horizontalSpace,
                            Text(
                              label,
                              style: TextStyles.header3.copyWith(
                                color: palette.neutrals1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
                if (additionalActions.isNotEmpty &&
                    destructiveActions.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    child: Divider(
                      color: palette.neutrals5,
                      height: 1.h,
                    ),
                  ),
                ...destructiveActions.map(
                  (item) {
                    final (onPressed, label) = item;
                    return InkWell(
                      onTap: () {
                        context.pop();
                        onPressed();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Row(
                          children: [
                            Text(
                              label,
                              style: TextStyles.header3.copyWith(
                                color: palette.primaryRed,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
