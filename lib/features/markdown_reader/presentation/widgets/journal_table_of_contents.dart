import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_outline_entity.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/journal_pages_bloc/journal_pages_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JournalTableOfContents extends StatelessWidget {
  final ValueChanged<int> onTap;
  const JournalTableOfContents({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalPagesBloc, JournalPagesState>(builder: (context, state) {
      return Container(
        color: Colors.teal,
        child: Paginator(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.getJournalContentsStatus),
            itemBuilder: (context, index) => JournalContentItem(
                  onTap: onTap,
                  content: state.contents[index],
                ),
            itemCount: state.contents.length,
            fetchMoreFunction: () {
              context.read<JournalPagesBloc>().add(GetMoreJournalTableOfContents());
            },
            hasMoreToFetch: state.contentsFetchMore,
            errorWidget: const Text('error')),
      );
    });
  }
}

class JournalContentItem extends StatelessWidget {
  final JournalOutlineEntity content;
  final ValueChanged<int> onTap;

  const JournalContentItem({
    required this.content,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(content.page),
        child: SizedBox(
          height: 78,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: content.image,
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
                      content.title,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.book),
                        const SizedBox(width: 4),
                        Text(
                          MyFunctions.getReadingTime(content.readTime),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 13, fontWeight: FontWeight.w400, color: primary),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 3,
                          width: 3,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: textSecondary),
                        ),
                        Text(
                          content.author,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
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
      ),
    );
  }
}
