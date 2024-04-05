import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_ui/common/extensions/iterable_join_with.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_network_image/app_network_image.dart';

class FeedPostBody extends StatelessWidget {
  const FeedPostBody({
    super.key,
    required this.image,
    required this.text,
    this.applyTextPadding = true,
  });

  final String? image;
  final String? text;
  final bool applyTextPadding;

  @override
  Widget build(BuildContext context) {
    final text = this.text;
    final image = this.image;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null && text.isNotEmpty)
          Padding(
            padding: applyTextPadding
                ? EdgeInsets.symmetric(horizontal: 24.w)
                : EdgeInsets.zero,
            child: Text(
              text,
              style: TextStyles.body.copyWith(
                color: Palette.of(context).neutrals1,
              ),
            ),
          ),
        if (image != null)
          AppNetworkImage(
            useBaseUrl: false,
            imageUrl: image,
            width: double.infinity,
            height: 250.h,
          ),
      ].separateWith(16.verticalSpace),
    );
  }
}
