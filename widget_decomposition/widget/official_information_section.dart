import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/settings/widgets/settings_section.dart';
import 'package:panodyssey_ui/settings/widgets/user_email_tile.dart';
import 'package:provider/provider.dart';

class OfficcialInformationSection extends StatelessWidget {
  const OfficcialInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final email = context
        .select<ProfileProvider, String?>((profile) => profile.user?.email);
    final registrationType = context.select<ProfileProvider, RegistrationType?>(
      (profile) => profile.user?.registrationType,
    );

    return SettingsSection.single(
      title: LocaleKeys.settings_officialInformation.tr(),
      subtitle: LocaleKeys.settings_officialInformationSubtitle.tr(),
      child: UserEmailTile(
        email: email ?? '',
        registrationType: registrationType,
      ),
    );
  }
}
