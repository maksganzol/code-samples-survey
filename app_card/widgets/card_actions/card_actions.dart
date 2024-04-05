import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/statistic_item.dart';
import 'package:panodyssey_ui/extensions/svg_color_filter.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

part 'card_action.dart';

class CardActions extends StatelessWidget {
  CardActions.creativeRoom({
    super.key,
    required int artriclesCount,
    required bool isFollowing,
    required VoidCallback onSharePressed,
    required VoidCallback onFollowPressed,
    required VoidCallback onOpenMenuPressed,
    this.margin,
  })  : leading = [
          CardAction.articlesCount(artriclesCount),
        ],
        trailing = [
          CardAction.addArticle(
            onPressed: onFollowPressed,
            isFollowing: isFollowing,
          ),
          CardAction.openMenu(onPressed: onOpenMenuPressed),
        ],
        center = [],
        spacing = 16.w;

  CardActions.publication({
    super.key,
    required int likesCount,
    required int commentsCount,
    required bool isLiked,
    required bool isBookmarked,
    required VoidCallback onLikePressed,
    required VoidCallback onCommentPressed,
    required VoidCallback onBookmarkPressed,
    required VoidCallback onOpenMenuPressed,
    required VoidCallback onRepostPressed,
    this.margin,
  })  : leading = [
          CardAction.like(
            likesCount,
            onPressed: onLikePressed,
            isLiked: isLiked,
          ),
          CardAction.comment(
            commentsCount,
            onPressed: onCommentPressed,
          ),
          CardAction.repostPulbication(
            onPressed: onRepostPressed,
          ),
        ],
        trailing = [
          CardAction.bookmark(
            isBookmarked,
            onPressed: onBookmarkPressed,
          ),
          CardAction.openMenu(onPressed: onOpenMenuPressed)
        ],
        center = [],
        spacing = 16.w;

  CardActions.commonPost(
    Palette palette, {
    super.key,
    required bool isLiked,
    required bool isRepostEnabled,
    required bool isLikeDisabled,
    required VoidCallback onLikePressed,
    required VoidCallback onCommentPressed,
    required VoidCallback onSharePressed,
    required VoidCallback onRepostPressed,
    required VoidCallback onOpenMenuPressed,
    this.margin,
  })  : center = [
          isLikeDisabled
              ? CardAction.likeDisabled(0, palette)
              : CardAction.likeLabled(
                  onPressed: onLikePressed,
                  isLiked: isLiked,
                ),
          CardAction.commentLabled(
            onPressed: onCommentPressed,
          ),
          CardAction.reposts(
            label: LocaleKeys.feed_actions_repost.tr(),
            onPressed: isRepostEnabled ? onRepostPressed : () {},
            color: isRepostEnabled ? palette.neutrals4 : palette.neutrals5,
          ),
          CardAction.share(
            label: LocaleKeys.feed_actions_share.tr(),
            onPressed: onSharePressed,
          ),
          CardAction.openMenu(
            label: 'Menu',
            onPressed: onOpenMenuPressed,
          ),
        ],
        trailing = [],
        leading = [],
        spacing = 24.w;

  final List<CardAction> leading;
  final List<CardAction> trailing;
  final List<CardAction> center;

  final EdgeInsets? margin;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeadingActions(context, leading),
          Expanded(child: _buildCenterActions(context, center)),
          _buildTrailingActions(context, trailing),
        ],
      ),
    );
  }

  Widget _buildCenterActions(
    BuildContext context,
    List<CardAction> actions,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions
            .mapIndexed(
              (index, action) => _buildAction(
                action,
                EdgeInsets.zero,
                Palette.of(context),
              ),
            )
            .toList(),
      );

  Widget _buildLeadingActions(
    BuildContext context,
    List<CardAction> actions,
  ) =>
      Row(
        children: actions
            .mapIndexed(
              (index, action) => _buildAction(
                action,
                index == 0
                    ? EdgeInsets.only(right: spacing)
                    : EdgeInsets.symmetric(horizontal: spacing),
                Palette.of(context),
              ),
            )
            .toList(),
      );

  Widget _buildTrailingActions(
    BuildContext context,
    List<CardAction> actions,
  ) =>
      Row(
        children: actions
            .mapIndexed(
              (index, action) => _buildAction(
                action,
                index == actions.length - 1
                    ? EdgeInsets.only(left: spacing)
                    : EdgeInsets.symmetric(horizontal: spacing),
                Palette.of(context),
              ),
            )
            .toList(),
      );

  Widget _buildAction(
    CardAction action,
    EdgeInsets padding,
    Palette palette,
  ) =>
      GestureDetector(
        onTap: action.onPressed,
        child: ColoredBox(
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: padding,
                child: action.icon,
              ),
              if (action.label != null) ...[
                2.verticalSpace,
                Text(
                  action.label!,
                  style: TextStyles.footnote.copyWith(
                    color: action.labelColor ?? palette.neutrals4,
                  ),
                )
              ]
            ],
          ),
        ),
      );
}
