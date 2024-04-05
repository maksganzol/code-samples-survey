import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_card/app_card.dart';

import '../card_headers/card_author.dart';
import 'publication_body_with_large_logo.dart';

class FeedPostPublicationBody extends StatelessWidget {
  const FeedPostPublicationBody({
    super.key,
    required this.avatar,
    required this.isCertified,
    required this.role,
    required this.displayName,
    required this.publicationImageUrl,
    required this.publicationTitle,
    required this.publicationDate,
    required this.readTime,
    required this.isRoomPremium,
    required this.onAuthorPressed,
    required this.onRoomPressed,
    required this.room,
    required this.onCardPressed,
    required this.posterName,
  });

  final String? avatar;
  final bool isCertified;
  final UserRole role;
  final String displayName;
  final String posterName;
  final String? publicationImageUrl;
  final String publicationTitle;
  final String? room;
  final DateTime publicationDate;
  final int readTime;

  final VoidCallback onAuthorPressed;
  final VoidCallback? onRoomPressed;

  final VoidCallback onCardPressed;

  final bool isRoomPremium;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            '$posterName ${LocaleKeys.feed_sharedThisArticle.tr()}',
            style: TextStyles.body,
          ),
        ),
        12.verticalSpace,
        DecoratedBox(
          decoration: BoxDecoration(
            color: palette.neutrals6,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(8.r),
            ),
          ),
          child: AppCard(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            onCardPressed: onCardPressed,
            header: CardAuthor(
              isRepost: true,
              avatar: avatar,
              isCertified: isCertified,
              role: role,
              displayName: displayName,
              room: room,
              isPremium: isRoomPremium,
              onAuthorPressed: onAuthorPressed,
              onRoomPressed: onRoomPressed,
            ),
            body: PublicationBodyWithLargeLogo(
              imageUrl: publicationImageUrl,
              title: publicationTitle,
              publicationDate: publicationDate,
              readTime: readTime,
              largeSpace: false,
              category: null,
              onCategoryPressed: null,
            ),
          ),
        ),
      ],
    );
  }
}
