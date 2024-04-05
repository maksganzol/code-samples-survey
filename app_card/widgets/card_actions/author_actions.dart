import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/widgets/app_button/app_button.dart';

class AuthorActions extends StatelessWidget {
  const AuthorActions({
    super.key,
    required this.role,
    required this.onFollow,
    required this.onConnect,
    required this.isFollowing,
    required this.isConnected,
  });

  final UserRole role;
  final VoidCallback onFollow;
  final VoidCallback onConnect;

  final bool isFollowing;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildFollowButton(),
        8.horizontalSpace,
        _buildConnectButton(),
      ],
    );
  }

  Widget _buildFollowButton() {
    if (isFollowing) {
      return AppButton.subscribedControlLabel(
        onPressed: onFollow,
        label: LocaleKeys.library_unfollow.tr(),
      );
    } else {
      if (role.isPro) {
        return AppButton.primaryRedControlLabel(
          label: LocaleKeys.library_following.tr(),
          onPressed: onFollow,
        );
      } else {
        return AppButton.primaryBlueControlLabel(
          label: LocaleKeys.library_following.tr(),
          onPressed: onFollow,
        );
      }
    }
  }

  Widget _buildConnectButton() {
    if (isConnected) {
      return AppButton.subscribedControlLabel(
        label: LocaleKeys.library_cancelConnection.tr(),
        onPressed: onConnect,
      );
    } else {
      if (role.isPro) {
        return AppButton.secondaryRedControlLabel(
          label: LocaleKeys.library_connect.tr(),
          onPressed: onConnect,
        );
      } else {
        return AppButton.secondaryBlueControlLabel(
          label: LocaleKeys.library_connect.tr(),
          onPressed: onConnect,
        );
      }
    }
  }
}
