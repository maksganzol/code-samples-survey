import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/widgets/phone_number_input/phone_number_controller.dart';
import 'package:panodyssey_ui/common/widgets/phone_number_input/phone_number_input.dart';
import 'package:panodyssey_ui/settings/widgets/settings_section.dart';

class PhoneNumberSectionWrapper extends StatelessWidget {
  const PhoneNumberSectionWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneNumberSettingBloc(
        profileProvider: context.read(),
      ),
      child: const PhoneNumberSection(),
    );
  }
}

class PhoneNumberSection extends StatefulWidget {
  const PhoneNumberSection({super.key});

  @override
  State<PhoneNumberSection> createState() => _PhoneNumberSectionState();
}

class _PhoneNumberSectionState extends State<PhoneNumberSection> {
  late final PhoneNumberController _controller = _initController();

  PhoneNumberController _initController() {
    final state = context.read<PhoneNumberSettingBloc>().state;
    return PhoneNumberController(
      phoneNumber: state.whenOrNull(initial: (phoneNumber) => phoneNumber),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsSection.single(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: PhoneNumberInput(
          label: 'Phone number',
          helpText:
              'For the convenience of syncing with contacts and exchanging information between users',
          hintText: '1 23 45 67 89',
          controller: _controller,
          countries: context.watch<PhoneCodeProvider>().phoneCodes,
        ),
      ),
    );
  }
}
