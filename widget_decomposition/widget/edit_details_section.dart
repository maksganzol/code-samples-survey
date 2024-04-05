import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:panodyssey_domain/models/company_model.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/extensions/build_context_is_pro_user.dart';
import 'package:panodyssey_ui/router/router.dart';
import 'package:panodyssey_ui/settings/widgets/settings_menu_item/settings_menu_item.dart';
import 'package:panodyssey_ui/settings/widgets/settings_section.dart';

class EditAccountSection extends StatelessWidget {
  const EditAccountSection({super.key});
  @override
  Widget build(BuildContext context) {
    final isPro = context.isProUser;

    final userCompany = context.select<ProfileProvider, CompanyModel?>(
      (profile) => profile.user?.company,
    );

    return SettingsSection(
      children: [
        SettingsMenuItem.arrowMore(
          title: LocaleKeys.settings_accountDetails_title.tr(),
          onPressed: () {
            context.push(AppRoute.editAccountDetails.path);
          },
        ),
        SettingsMenuItem.arrowMore(
          title: LocaleKeys.settings_addressDetails_title.tr(),
          onPressed: () {
            context.push(AppRoute.editAccountAddress.path);
          },
        ),
        if (isPro && userCompany != null)
          SettingsMenuItem.arrowMore(
            title: 'Structure',
            onPressed: () {
              context.push(AppRoute.editCompanyDetails.path);
            },
          )
      ],
    );
  }
}
