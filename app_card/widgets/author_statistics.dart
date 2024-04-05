import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_ui/common/extensions/iterable_join_with.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

class AuthorStatistics extends StatelessWidget {
  const AuthorStatistics({
    super.key,
    required this.rooms,
    required this.publications,
  });

  final int rooms;
  final int publications;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyles.body2,
            children: [
              TextSpan(
                text: '$rooms ',
                style: TextStyle(color: palette.neutrals1),
              ),
              TextSpan(
                text: 'Creative Rooms',
                style: TextStyle(color: palette.neutrals4),
              ),
            ],
          ),
        ),
        Assets.images.svg.dot.svg(),
        RichText(
          text: TextSpan(
            style: TextStyles.body2,
            children: [
              TextSpan(
                text: '$publications ',
                style: TextStyle(color: palette.neutrals1),
              ),
              TextSpan(
                text: 'Readings',
                style: TextStyle(color: palette.neutrals4),
              ),
            ],
          ),
        )
      ].separateWith(8.horizontalSpace),
    );
  }
}
