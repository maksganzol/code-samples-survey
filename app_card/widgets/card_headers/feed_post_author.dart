import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/utils/date_time_formatters.dart';
import 'package:panodyssey_ui/common/widgets/app_avatar/app_avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedPostAuthor extends StatelessWidget {
  const FeedPostAuthor({
    super.key,
    required this.avatar,
    required this.displayName,
    required this.memberFrom,
    required this.date,
    required this.isAuthorCertified,
    required this.role,
    required this.onPressed,
    required this.isPublication,
  });

  final String? avatar;
  final bool isAuthorCertified;
  final UserRole role;

  final String displayName;
  final DateTime memberFrom;
  final DateTime date;

  final VoidCallback onPressed;

  final bool isPublication;

  // String _formattedMemberFrom(String languageCode) =>
  //     DateTimeFormatters.monthAndYear(languageCode).format(memberFrom);

  String _formattedDate(BuildContext context) {
    final locale = context.locale.languageCode;

    if (isPublication) {
      return LocaleKeys.feed_publishedOn
          .tr(args: [DateTimeFormatters.feedPostDate(locale).format(date)]);
    }

    return LocaleKeys.feed_publishedAgo.tr(args: [
      timeago.format(date, locale: locale),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
        child: Row(
          children: [
            AppAvatar.large(
              url: avatar,
              isCertified: isAuthorCertified,
              role: role,
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: TextStyles.header3Georgia,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(
                  //   'Author',
                  //   style: TextStyles.footnote.copyWith(
                  //     color: Palette.of(context).neutrals4,
                  //   ),
                  // ),
                  Text(
                    _formattedDate(context),
                    style: TextStyles.footnote.copyWith(
                      color: Palette.of(context).neutrals4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
