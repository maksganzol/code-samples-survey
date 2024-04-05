import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/utils/dialog_utils.dart';
import 'package:panodyssey_ui/common/widgets/app_card/app_card.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/additional_actions_menu.dart';
import 'package:panodyssey_ui/extensions/svg_color_filter.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

import 'widgets/card_actions/card_actions.dart';
import 'widgets/card_body/publication_body_with_small_logo.dart';
import 'widgets/card_headers/card_author.dart';
import 'widgets/card_body/publication_body_with_large_logo.dart';
import 'widgets/publication_statictics.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({
    super.key,
    required this.avatar,
    required this.isCertified,
    required this.role,
    required this.displayName,
    required this.publicationImageUrl,
    required this.publicationTitle,
    required this.likes,
    required this.comments,
    required this.publicationDate,
    required this.readTime,
    required this.category,
    required this.isBookmarked,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.onBookmarkPressed,
    required this.onCardPressed,
    required this.onCategoryPressed,
    required this.isLiked,
    required this.isRoomPremium,
    required this.onAuthorPressed,
    required this.onRoomPressed,
    required this.room,
    required this.onReportPressed,
    required this.onBlockAuthorPressed,
    required this.isPremium,
    required this.onRepostPressed,
    required this.likeType,
    required this.readings,
    required this.feedReposts,
    required this.isReposted,
    this.isLarge = true,
    this.rating,
  });

  final String? avatar;
  final bool isCertified;
  final UserRole role;
  final String displayName;
  final String? publicationImageUrl;
  final String publicationTitle;
  final int likes;
  final int comments;
  final int readings;
  final int feedReposts;

  final String? room;
  final DateTime publicationDate;
  final int readTime;
  final String? category;
  final bool isBookmarked;
  final ValueSetter<LikeType?> onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback onBookmarkPressed;
  final VoidCallback onCardPressed;
  final VoidCallback? onCategoryPressed;
  final VoidCallback onAuthorPressed;
  final VoidCallback? onRoomPressed;
  final VoidCallback? onReportPressed;
  final VoidCallback? onBlockAuthorPressed;
  final VoidCallback onRepostPressed;

  final bool isLarge;
  final bool isLiked;
  final bool isReposted;

  final LikeType? likeType;
  final bool isRoomPremium;

  final bool isPremium;

  final int? rating;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onCardPressed: onCardPressed,
      header: CardAuthor(
        avatar: avatar,
        isCertified: isCertified,
        role: role,
        displayName: displayName,
        room: room,
        isPremium: isRoomPremium,
        onAuthorPressed: onAuthorPressed,
        onRoomPressed: onRoomPressed,
        rating: rating,
      ),
      body: isLarge
          ? PublicationBodyWithLargeLogo(
              imageUrl: publicationImageUrl,
              title: publicationTitle,
              publicationDate: publicationDate,
              readTime: readTime,
              category: category,
              onCategoryPressed: onCategoryPressed,
            )
          : PublicationBodyWithSmallLogo(
              imageUrl: publicationImageUrl,
              title: publicationTitle,
              publicationDate: publicationDate,
              readTime: readTime,
              category: category,
              onCategoryPressed: onCategoryPressed,
            ),
      additionalStatistics: PublicationStatistics(
        likes: likes,
        comments: comments,
        onCommentsPressed: onCommentPressed,
        views: readings,
        reposts: feedReposts,
      ),
      actions: CardActions.commonPost(
        Palette.of(context),
        isRepostEnabled: !isReposted,
        isLiked: isLiked,
        onLikePressed: () {
          // DialogUtils.showAppDialog(
          //   context,
          //   barrierDismissible: true,
          //   barrierColor: Colors.transparent,
          //   builder: (context) => LikeTypeSelect.defaultTypes(
          //     onLikePressed:
          if (likeType == null || likeType == LikeType.unknown) {
            onLikePressed(LikeType.like);
          } else {
            onLikePressed(null);
          }
          //   selectedType: likeType,
          // ),
          // );
        },
        onCommentPressed: onCommentPressed,
        onOpenMenuPressed: () => _onOpenMenu(context),
        onRepostPressed: onRepostPressed,
        onSharePressed: onSharePressed,
        isLikeDisabled: isPremium,
      ),
    );
  }

  void _onOpenMenu(BuildContext context) {
    DialogUtils.showAppDialog(
      context,
      barrierDismissible: true,
      builder: (context) => AdditionalActionsMenu(
        additionalActions: [
          if (!isPremium)
            (
              onBookmarkPressed,
              LocaleKeys.library_bookmark.tr(),
              isBookmarked
                  ? Assets.images.svg.bookmarkFilled.svg()
                  : Assets.images.svg.bookmark.svg(
                      colorFilter:
                          Palette.of(context).neutrals1.toColorFilter(),
                    ),
            ),
        ],
        destructiveActions: [
          if (onReportPressed != null)
            (
              onReportPressed!,
              LocaleKeys.reportThisPublication.tr(),
            ),
          if (onBlockAuthorPressed != null)
            (
              onBlockAuthorPressed!,
              LocaleKeys.blockAuthor.tr(),
            ),
        ],
      ),
    );
  }
}
