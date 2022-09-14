import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/journal_article_single.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/purchase_bottom_sheet.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleItem extends StatelessWidget {
  final JournalArticleEntity magazineItemEntity;
  final EdgeInsets margin;

  const ArticleItem({required this.magazineItemEntity, this.margin = EdgeInsets.zero, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        if (magazineItemEntity.isBought || !magazineItemEntity.isPremium) {
          Navigator.of(context, rootNavigator: true).push(
            fade(
              page: JournalArticleSingle(
                bloc: context.read<JournalBloc>(),
                slug: magazineItemEntity.slug,
              ),
            ),
          );
        } else {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) {
              return PurchaseBottomSheet(
                amount: 0,
                onButtonTap: () {
                  Navigator.of(_).pop();
                  Navigator.of(context).push(fade(
                      page: OneTimePayment(
                          price: 0,
                          title: magazineItemEntity.title,
                          imageUrl: magazineItemEntity.image.middle,
                          isJournal: false,
                          isRegistered:
                              context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated,
                          subtitle: magazineItemEntity.redaction,
                          id: magazineItemEntity.id)));
                },
              );
            },
          );
        }
      },
      child: Container(
        height: 78,
        margin: margin,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: magazineItemEntity.image.middle,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 79,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    magazineItemEntity.title,
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        magazineItemEntity.redaction,
                        style:
                            Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: textSecondary),
                      ),
                      Text(
                        MyFunctions.getPublishedDate(magazineItemEntity.publishDate),
                        style:
                            Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
