import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/extensions/date_time_timezoned.dart';
import 'package:panodyssey_ui/common/extensions/iterable_join_with.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/utils/date_time_formatters.dart';
import 'package:panodyssey_ui/extensions/svg_color_filter.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class PublicationSubInfo extends StatelessWidget {
  const PublicationSubInfo({
    super.key,
    required this.publicationDate,
    required this.readTime,
    required this.color,
  });

  final DateTime publicationDate;
  final int readTime;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateTimeFormatters.publicationDate(context.locale.languageCode)
              .format(publicationDate.timezoned(context)),
          style: TextStyles.controlLabel.copyWith(color: color),
        ),
        Assets.images.svg.dot.svg(colorFilter: color.toColorFilter()),
        Text(
          LocaleKeys.profile_readTime.tr(args: ['$readTime']),
          style: TextStyles.controlLabel.copyWith(color: color),
        ),
      ].separateWith(8.horizontalSpace),
    );
  }
}
