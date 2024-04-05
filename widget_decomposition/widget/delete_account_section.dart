import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/utils/dialog_utils.dart';
import 'package:panodyssey_ui/extensions/svg_color_filter.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';
import 'package:panodyssey_ui/router/router.dart';

import '../../../widgets/action_confirmation_dialog.dart';
import '../../../widgets/settings_menu_item/settings_menu_item.dart';

class DeleteAccountSection extends StatelessWidget {
  const DeleteAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Column(
      children: [
        SettingsMenuItem.action(
          title: LocaleKeys.settings_deleteAccount_title.tr(),
          icon: Assets.images.svg.close.svg(
            colorFilter: Palette.of(context).primaryRed.toColorFilter(),
          ),
          onPressed: () {
            DialogUtils.showAppDialog(
              context,
              builder: (_) => ActionConfirmationDialog(
                title: LocaleKeys.settings_deleteAccount_title.tr(),
                text: LocaleKeys.settings_deleteAccount_warning.tr(),
                confirmText: LocaleKeys.settings_deleteAccount_accept.tr(),
                onConfirm: () => _deleteAccount(context),
              ),
            );
          },
        ),
        Container(
          height: 24.h,
          color: palette.neutrals6,
          width: double.infinity,
        )
      ],
    );
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final profileProvider = context.read<ProfileProvider>();
    final router = GoRouter.of(context);
    final deleteResult = await profileProvider.deleteAccount();
    deleteResult.map((_) async {
      await profileProvider.logout();
      router.go(AppRoute.accountDeleted.path);
    });
  }
}
