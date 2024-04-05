import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/extensions/iterable_join_with.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/extensions/svg_color_filter.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class PublicationStatistics extends StatelessWidget {
  const PublicationStatistics({
    super.key,
    required this.likes,
    required this.comments,
    required this.views,
    required this.reposts,
    required this.onCommentsPressed,
  });

  final int likes;
  final int comments;
  final int views;
  final int reposts;

  final VoidCallback onCommentsPressed;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: palette.neutrals6,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _FeedStatisticsItem(
                  value: likes,
                  icon: Assets.images.svg.likeReactionSmall.svg(),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: onCommentsPressed,
                  child: _FeedStatisticsItem(
                    value: comments,
                    text: LocaleKeys.feed_stat_comments.tr(),
                  ),
                ),
                _FeedStatisticsItem(
                  value: reposts,
                  text: LocaleKeys.feed_stat_reposts.tr(),
                ),
                _FeedStatisticsItem(
                  value: views,
                  icon: Assets.images.svg.eyeOpened.svg(
                    height: 16.h,
                    colorFilter: palette.neutrals4.toColorFilter(),
                  ),
                ),
              ].separateWith(
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Assets.images.svg.dot.svg(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FeedStatisticsItem extends StatelessWidget {
  const _FeedStatisticsItem({
    required this.value,
    this.text,
    this.icon,
  });

  final int value;
  final String? text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final text = this.text;
    final icon = this.icon;

    final style = TextStyles.label.copyWith(
      color: Palette.of(context).neutrals4,
      fontWeight: FontWeight.w400,
    );

    return Row(
      children: [
        if (icon != null) icon,
        Text('$value', style: style),
        if (text != null) Text(text, style: style),
      ].separateWith(4.horizontalSpace),
    );
  }
}
