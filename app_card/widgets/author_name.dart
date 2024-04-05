import 'package:flutter/cupertino.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/widgets/app_flag.dart';

class AuthorName extends StatelessWidget {
  const AuthorName({
    super.key,
    required this.name,
    required this.country,
  });

  final String name;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyles.header2Georgia,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AppFlag(countryCode: country),
      ],
    );
  }
}
