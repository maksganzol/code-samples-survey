part of 'card_actions.dart';

class CardAction {
  final Widget icon;
  final String? label;
  final Color? labelColor;
  final VoidCallback? onPressed;
  final Widget Function(VoidCallback? onPressed)? tooltipBuilder;

  CardAction.openMenu({
    required this.onPressed,
    this.tooltipBuilder,
    this.label,
    this.labelColor,
  }) : icon = Assets.images.svg.menuMore.svg();

  CardAction.share({
    required this.onPressed,
    this.tooltipBuilder,
    this.label,
    this.labelColor,
  }) : icon = Assets.images.svg.cardShare.svg();

  CardAction.addArticle({
    required this.onPressed,
    bool isFollowing = false,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = isFollowing
            ? Assets.images.svg.addArticleActive.svg()
            : Assets.images.svg.addArticle.svg(),
        label = null;

  CardAction.articlesCount(
    int articlesCount, {
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = StatisticItem.creativeRoomArticles(articlesCount),
        onPressed = null,
        label = null;

  CardAction.like(
    int likesCount, {
    bool isLiked = false,
    required this.onPressed,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = isLiked
            ? StatisticItem.likesActive(likesCount)
            : StatisticItem.likes(likesCount),
        label = null;

  CardAction.likeLabled({
    bool isLiked = false,
    required this.onPressed,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = isLiked
            ? Assets.images.svg.likeActive.svg()
            : Assets.images.svg.like.svg(),
        label = LocaleKeys.feed_actions_like.tr();

  CardAction.commentLabled({
    required this.onPressed,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = Assets.images.svg.comment.svg(),
        label = LocaleKeys.feed_actions_comment.tr();

  CardAction.comment(
    int commentsCount, {
    required this.onPressed,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = StatisticItem.comments(commentsCount),
        label = null;

  CardAction.bookmark(
    bool isBookmarked, {
    required this.onPressed,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = isBookmarked
            ? Assets.images.svg.bookmarkFilled.svg()
            : Assets.images.svg.bookmark.svg(),
        label = null;

  CardAction.likeDisabled(
    int likesCount,
    Palette palette, {
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = Assets.images.svg.like.svg(
          colorFilter: palette.neutrals6.toColorFilter(),
        ),
        onPressed = null,
        label = LocaleKeys.feed_actions_like.tr();

  CardAction.bookmarkDisabled(
    bool isBookmarked,
    Palette palette, {
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = Assets.images.svg.bookmark.svg(
          colorFilter: palette.neutrals5.toColorFilter(),
        ),
        onPressed = null,
        label = null;

  CardAction.views(
    int viewsCount, {
    Color? color,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = StatisticItem.viewes(viewsCount, color: color),
        onPressed = null,
        label = null;

  CardAction.reposts({
    required Color color,
    required this.onPressed,
    this.label,
    this.tooltipBuilder,
    this.labelColor,
  }) : icon = Assets.images.svg.repost.svg(
          colorFilter: color.toColorFilter(),
        );

  CardAction.repostPulbication({
    required this.onPressed,
    this.tooltipBuilder,
    this.labelColor,
  })  : icon = Assets.images.svg.repost.svg(),
        label = null;
}
