import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/notification_bloc/notification_bloc.dart';
import 'package:anatomica/features/home/presentation/parts/notification_single.dart';
import 'package:anatomica/features/home/presentation/widgets/notifications_container.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationBloc()..add(const NotificationEvent.getNotifications()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: appBarDivider,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: WScaleAnimation(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      child: SvgPicture.asset(
                        AppIcons.chevronLeft,
                        color: textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                LocaleKeys.notifications.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Spacer()
            ],
          ),
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            return Paginator(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              padding: const EdgeInsets.all(16).copyWith(
                  bottom: MediaQuery.of(context).padding.bottom + 136),
              emptyWidget: Center(
                child: SingleChildScrollView(
                  child: EmptyPage(
                    title: LocaleKeys.no_notifications.tr(),
                    iconPath: AppIcons.emptyA,
                  ),
                ),
              ),
              paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(
                  state.notificationsStatus),
              itemBuilder: (c, index) {
                return NotificationItem(
                  isRead: state.notifications[index].read,
                  time: state.notifications[index].type,
                  title: state.notifications[index].title,
                  onDetailsTap: () {
                    context.read<NotificationBloc>().add(
                        NotificationEvent.readNotification(
                            id: state.notifications[index].id));
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return const NotificationSingle();
                      },
                    );
                  },
                );
              },
              itemCount: state.notifications.length,
              fetchMoreFunction: () {
                context
                    .read<NotificationBloc>()
                    .add(const NotificationEvent.getMoreNotifications());
              },
              hasMoreToFetch: state.notificationsFetchMore,
              errorWidget: const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
