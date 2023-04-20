import 'dart:async';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_article/purchased_article_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/purchased_journal/purchased_journal_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/parts/pincodes.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/components/refresh_panel.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RestoreVerifyDialog extends StatefulWidget {
  final bool isJournal;

  const RestoreVerifyDialog({required this.isJournal, Key? key}) : super(key: key);

  @override
  State<RestoreVerifyDialog> createState() => _RestoreVerifyDialogState();
}

class _RestoreVerifyDialogState extends State<RestoreVerifyDialog> {
  late TextEditingController controller;
  late StreamController<ErrorAnimationType> _errorController;

  @override
  void initState() {
    _errorController = StreamController<ErrorAnimationType>();
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 380,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.verify.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.close,
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  LocaleKeys.write_sent_code.tr(),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(color: Color(0x292B8364), blurRadius: 12, offset: Offset(0, 4))],
                      color: const Color(0x1F43B7B1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primary)),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: BlocBuilder<RestoreBloc, RestoreState>(
                    builder: (context, state) {
                      return Text(
                        state.phone.isEmpty ? '**************' : state.phone.replaceRange(6, 11, '******'),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                      );
                    },
                  ),
                ),
                Text(
                  LocaleKeys.write_code.tr(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                RestorePinCode(
                  errorAnimationController: _errorController,
                  textEditingController: controller,
                ),
                BlocBuilder<RestoreBloc, RestoreState>(
                  builder: (context, state) {
                    if (state.verifyStatus == FormzStatus.submissionFailure) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          state.verifyError,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: red),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const RefreshPanel(),
                const SizedBox(
                  height: 20,
                ),
                WButton(
                  padding: EdgeInsets.zero,
                  onTap: () {
                    if (controller.text.length == 6) {
                      context.read<RestoreBloc>().add(RestoreEvent.verifyCode(
                          code: controller.text,
                          onSuccess: (signature) async {
                            context.read<RestoreBloc>().add(RestoreEvent.sendRestore(
                                isJournal: widget.isJournal,
                                onSuccess: () {
                                  if (widget.isJournal) {
                                    context
                                        .read<PurchasedJournalBloc>()
                                        .add(PurchasedJournalEvent.getArticle(isRefresh: false));
                                  } else {
                                    context
                                        .read<PurchasedArticleBloc>()
                                        .add(PurchasedArticleEvent.getArticle(isRefresh: false));
                                  }
                                  Navigator.pop(context);
                                },
                                signature: signature));
                            await StorageRepository.putBool(key: StoreKeys.isPurchaseRestored, value: true);
                          },
                          onError: (error) {
                            _errorController.sink.add(ErrorAnimationType.shake);
                          }));
                    } else {
                      _errorController.sink.add(ErrorAnimationType.shake);
                    }
                  },
                  height: 40,
                  borderRadius: 6,
                  text: LocaleKeys.next.tr(),
                  textColor: white,
                )
              ],
            ),
          ),
        ),
      );
}
