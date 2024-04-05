import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/publication_sub_info.dart';
import 'package:panodyssey_ui/common/widgets/app_chip.dart';
import 'package:panodyssey_ui/common/widgets/app_network_image/app_network_image.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class PublicationBodyWithLargeLogo extends StatelessWidget {
  const PublicationBodyWithLargeLogo({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.publicationDate,
    required this.readTime,
    required this.category,
    this.onCategoryPressed,
    this.largeSpace = true,
  });

  final String? imageUrl;
  final String title;
  final DateTime publicationDate;
  final int readTime;
  final String? category;
  final VoidCallback? onCategoryPressed;
  final bool largeSpace;

  @override
  Widget build(BuildContext context) {
    final category = this.category;

    final palette = Palette.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppNetworkImage(
          imageUrl: imageUrl,
          height: 192.h,
          width: double.infinity,
          borderRadius: BorderRadius.circular(8),
          errorWidget: Container(
            color: Palette.of(context).neutrals6,
            height: 192.h,
          ),
        ),
        16.verticalSpace,
        PublicationSubInfo(
          publicationDate: publicationDate,
          readTime: readTime,
          color: Palette.of(context).neutrals4,
        ),
        largeSpace ? 16.verticalSpace : 8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyles.header2Georgia,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
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
