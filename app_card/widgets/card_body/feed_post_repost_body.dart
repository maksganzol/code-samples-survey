import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/widgets/app_card/app_card.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/card_body/feed_post_body.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/card_body/feed_post_publication_body.dart';
import 'package:panodyssey_ui/common/widgets/app_card/widgets/card_headers/card_author.dart';

class FeedPostRepostBody extends StatelessWidget {
  const FeedPostRepostBody({
    super.key,
    required this.feedPost,
    required this.onContentPressed,
    required this.onAuthorPressed,
    required this.onRoomPressed,
  });

  final FeedPostModel feedPost;
  final VoidCallback onContentPressed;
  final VoidCallback onAuthorPressed;
  final VoidCallback onRoomPressed;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: feedPost.maybeMap(
        post: (_) => Palette.of(context).neutrals6,
        orElse: () => Colors.transparent,
      ),
      child: AppCard(
        padding: feedPost.maybeMap(
          publication: (_) => EdgeInsets.zero,
          orElse: () => EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
        ),
        onCardPressed: () {},
        header: feedPost.maybeMap(
          publication: (_) => null,
          orElse: () => CardAuthor(
            isRepost: true,
            avatar: feedPost.avatar,
            role: feedPost.role,
            isCertified: feedPost.isCertified,
            displayName: feedPost.displayName,
            isPremium: false,
            onAuthorPressed: onAuthorPressed,
            onRoomPressed: null,
          ),
        ),
        body: feedPost.maybeMap(
          post: (post) => FeedPostBody(
            image: post.image,
            text: post.text,
            applyTextPadding: false,
          ),
          publication: (publication) => FeedPostPublicationBody(
            avatar: publication.publication?.ownerAvatar,
            isCertified: publication.publication?.isOwnerCertified ?? false,
            role: publication.publication?.ownerRole ?? UserRole.writer,
            displayName: publication.publication?.ownerDisplayName ?? '',
            publicationImageUrl: publication.publication?.cover,
            publicationTitle: publication.publication?.title ?? '',
            publicationDate:
                publication.publication?.publishedAt ?? DateTime.now(),
            readTime: publication.publication?.readTime ?? 0,
            isRoomPremium:
                publication.publication?.creativeRoom.isPremium ?? false,
            onAuthorPressed: onAuthorPressed,
            onRoomPressed: onRoomPressed,
            onCardPressed: onContentPressed,
            room: publication.publication?.creativeRoom.name,
            posterName: publication.displayName,
          ),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
