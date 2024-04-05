import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/widgets/app_button/app_button.dart';

class ConnectionRequestActions extends StatelessWidget {
  const ConnectionRequestActions({
    super.key,
    required this.role,
    required this.onApprove,
    required this.onDecline,
  });

  final UserRole role;
  final VoidCallback onApprove;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildApproveButton(),
        8.horizontalSpace,
        _buildDeclineButton(),
      ],
    );
  }

  Widget _buildApproveButton() {
    if (role.isPro) {
      return AppButton.primaryRedControlLabel(
        label: LocaleKeys.profile_approve.tr(),
        onPressed: onApprove,
      );
    } else {
      return AppButton.primaryBlueControlLabel(
        label: LocaleKeys.profile_approve.tr(),
        onPressed: onApprove,
      );
    }
  }

  Widget _buildDeclineButton() {
    if (role.isPro) {
      return AppButton.secondaryRedControlLabel(
        label: LocaleKeys.profile_decline.tr(),
        onPressed: onDecline,
      );
    } else {
      return AppButton.secondaryBlueControlLabel(
        label: LocaleKeys.profile_decline.tr(),
        onPressed: onDecline,
      );
    }
  }
}
