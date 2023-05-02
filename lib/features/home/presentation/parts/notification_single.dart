import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/home/presentation/blocs/notification_bloc/notification_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class NotificationSingle extends StatelessWidget {
  final NotificationBloc notificationBloc;
  const NotificationSingle({
    required this.notificationBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: notificationBloc,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: bottomSheetHeader,
                  borderRadius: BorderRadius.circular(2),
                ),
                margin: const EdgeInsets.only(bottom: 6),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: state.notificationSingleStatus ==
                        FormzStatus.submissionSuccess
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyFunctions.getPublishedDate(
                                state.notificationSingle?.createdAt ?? ''),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.notificationSingle?.title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                Html(
                                  data: state.notificationSingle?.content ?? '',
                                  style: {
                                    "p": Style(fontSize: FontSize.medium),
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : state.notificationSingleStatus ==
                            FormzStatus.submissionInProgress
                        ? const SizedBox(
                            width: double.maxFinite,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          )
                        : const SizedBox(),
              )
            ],
          );
        },
      ),
    );
  }
}
