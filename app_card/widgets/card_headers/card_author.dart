import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_avatar/app_avatar.dart';
import 'package:panodyssey_ui/common/widgets/clickable_text_span/clickable_text_span.dart';
import 'package:panodyssey_ui/common/widgets/rating_badge.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class CardAuthor extends StatelessWidget {
  const CardAuthor({
    super.key,
    required this.avatar,
    required this.isCertified,
    required this.role,
    required this.displayName,
    required this.isPremium,
    required this.onAuthorPressed,
    required this.onRoomPressed,
    this.room,
    this.isRepost = false,
    this.rating,
  });

  final String? avatar;
  final bool isCertified;
  final UserRole role;
  final String displayName;
  final String? room;
  final bool isPremium;
  final VoidCallback onAuthorPressed;
  final VoidCallback? onRoomPressed;
  final bool isRepost;
  final int? rating;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final rating = this.rating;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (rating != null) ...[
          Text(
            rating < 10 ? '0$rating' : '$rating',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              color: Palette.of(context).neutrals5,
            ),
          ),
          RatingBadge(rating: rating, withNumber: false),
          8.horizontalSpace,
        ],
        if (isRepost) ...[
          Assets.images.svg.repost.svg(),
          16.horizontalSpace,
        ],
        GestureDetector(
          onTap: onAuthorPressed,
          child: AppAvatar.small(
            url: avatar,
            isCertified: isCertified,
            role: role,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyles.footnote.copyWith(
                color: palette.neutrals1,
              ),
              children: [
                ClickableTextSpan(
                  text: displayName,
                  onPressed: onAuthorPressed,
                ),
                if (room != null) ...[
                  TextSpan(
                    text: ' ${LocaleKeys.library_in.tr()} ',
                    style: TextStyle(color: palette.neutrals4),
                  ),
                  if (isPremium)
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Assets.images.svg.primeRoomStar.svg(),
                      ),
                    ),
                  ClickableTextSpan(
                    text: room,
                    onPressed: onRoomPressed,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
