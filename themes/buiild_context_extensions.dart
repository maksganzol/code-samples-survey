// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../themes/theme.dart';

extension BuildContextExt on BuildContext {
  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;
}
