import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/utils/dialog_utils.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/additional_actions_menu.dart';
import 'package:panodyssey_ui/gen/assets.gen.dart';

import 'app_card.dart';
import 'widgets/card_actions/card_actions.dart';
import 'widgets/card_headers/card_author.dart';
import 'widgets/card_body/creative_room_body.dart';

class CreativeRoomCard extends StatelessWidget {
  const CreativeRoomCard({
    super.key,
    required this.avatar,
    required this.isCertified,
    required this.role,
    required this.displayName,
    required this.creativeRoomImageUrl,
    required this.creativeRoomTitle,
    required this.artriclesCount,
    required this.onSharePressed,
    required this.onFollowPressed,
    required this.onCardPressed,
    required this.isPremium,
    required this.isFollowing,
    required this.onAuthorPressed,
    required this.onReportPressed,
    required this.onBlockAuthorPressed,
  });
  final VoidCallback onCardPressed;

  final String? avatar;
  final bool isCertified;
  final UserRole role;
  final String displayName;
  final String? creativeRoomImageUrl;
  final String creativeRoomTitle;
  final int artriclesCount;
  final VoidCallback onSharePressed;
  final VoidCallback onFollowPressed;
  final VoidCallback onAuthorPressed;
  final VoidCallback? onReportPressed;
  final VoidCallback? onBlockAuthorPressed;

  final bool isPremium;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onCardPressed: onCardPressed,
      header: CardAuthor(
        avatar: avatar,
        isCertified: isCertified,
        role: role,
        displayName: displayName,
        isPremium: isPremium,
        onAuthorPressed: onAuthorPressed,
        onRoomPressed: null,
      ),
      body: CreativeRoomBody(
        role: role,
        imageUrl: creativeRoomImageUrl,
        title: creativeRoomTitle,
        isPremium: isPremium,
      ),
      actions: CardActions.creativeRoom(
        isFollowing: isFollowing,
        artriclesCount: artriclesCount,
        onSharePressed: onSharePressed,
        onFollowPressed: onFollowPressed,
        onOpenMenuPressed: () {
          DialogUtils.showAppDialog(
            context,
            barrierDismissible: true,
            builder: (context) => AdditionalActionsMenu(
              additionalActions: [
                (
                  onSharePressed,
                  LocaleKeys.shareCreativeRoom.tr(),
                  Assets.images.svg.share.svg(),
                ),
              ],
              destructiveActions: [
                if (onReportPressed != null)
                  (onReportPressed!, LocaleKeys.reportThisCreativeRoom.tr()),
                if (onBlockAuthorPressed != null)
                  (onBlockAuthorPressed!, LocaleKeys.blockAuthor.tr()),
              ],
            ),
          );
        },
      ),
    );
  }
}
