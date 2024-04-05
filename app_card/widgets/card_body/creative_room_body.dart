import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_network_image/app_network_image.dart';
import 'package:panodyssey_ui/extensions/svg_color_filter.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class CreativeRoomBody extends StatelessWidget {
  const CreativeRoomBody({
    super.key,
    required this.role,
    required this.imageUrl,
    required this.title,
    required this.isPremium,
  });

  final UserRole role;
  final String? imageUrl;
  final String title;
  final bool isPremium;

  ColorFilter _colorFilter(Palette palette) {
    if (isPremium) {
      return palette.secondaryYellow.toColorFilter();
    } else {
      return palette.primaryGreen.toColorFilter();
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Assets.images.svg.folder.svg(
                    colorFilter: _colorFilter(Palette.of(context)),
                  ),
                  if (imageUrl != null)
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.all(2.h).copyWith(top: 10.h),
                        child: AppNetworkImage(
                          imageUrl: imageUrl,
                          borderRadius: BorderRadius.circular(8),
                          errorWidget: const SizedBox(),
                        ),
                      ),
                    ),
                ],
              ),
              16.horizontalSpace,
              Expanded(
                child: Text(title, style: TextStyles.header3Georgia),
              ),
            ],
          ),
        ),
        32.horizontalSpace,
        if (isPremium) Assets.images.svg.primeRoomStar.svg(),
      ],
    );
  }
}
