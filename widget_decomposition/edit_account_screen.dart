import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';

import '../../widgets/settings_scaffold.dart';
import 'widget/delete_account_section.dart';
import 'widget/edit_details_section.dart';
import 'widget/official_information_section.dart';
import 'widget/phone_number_section.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: LocaleKeys.settings_editAccount.tr(),
      children: const [
        OfficcialInformationSection(),
        PhoneNumberSectionWrapper(),
        EditAccountSection(),
        DeleteAccountSection(),
      ],
    );
  }
}
