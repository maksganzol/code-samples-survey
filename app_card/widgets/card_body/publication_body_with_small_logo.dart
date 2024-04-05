import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/publication_sub_info.dart';
import 'package:panodyssey_ui/common/widgets/app_chip.dart';
import 'package:panodyssey_ui/common/widgets/app_network_image/app_network_image.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class PublicationBodyWithSmallLogo extends StatelessWidget {
  const PublicationBodyWithSmallLogo({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.publicationDate,
    required this.readTime,
    required this.category,
    this.onCategoryPressed,
  });

  final String? imageUrl;
  final String title;
  final DateTime publicationDate;
  final int readTime;
  final String? category;
  final VoidCallback? onCategoryPressed;

  @override
  Widget build(BuildContext context) {
    final category = this.category;

    final palette = Palette.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(
              imageUrl: imageUrl,
              height: 62.h,
              width: 80.w,
              borderRadius: BorderRadius.circular(8),
              errorWidget: Container(
                color: Palette.of(context).neutrals6,
                height: 62.h,
                width: 80.w,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  title,
                  style: TextStyles.header3Georgia,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        PublicationSubInfo(
          publicationDate: publicationDate,
          readTime: readTime,
          color: Palette.of(context).neutrals4,
        ),
        if (category != null) ...[
          16.verticalSpace,
          AppChip(
            fillColor: palette.neutrals6,
            textColor: palette.neutrals1,
            text: category,
            icon: Assets.images.svg.categoryTag.svg(),
            onPressed: onCategoryPressed,
          ),
        ]
      ],
    );
  }
}
