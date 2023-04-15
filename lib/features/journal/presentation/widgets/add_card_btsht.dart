import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/bloc/payment_card/payment_cards_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/profile/domain/usecases/create_payment_cards_usecase.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCardBtsht extends StatefulWidget {
  final bool isWaiting;
  final Function(CreateCardParam) onAddCardSuccess;
  const AddCardBtsht({required this.onAddCardSuccess, required this.isWaiting, Key? key}) : super(key: key);

  @override
  State<AddCardBtsht> createState() => _AddCardBtshtState();
}

class _AddCardBtshtState extends State<AddCardBtsht> {
  late TextEditingController cardController;
  late TextEditingController dateController;
  late PaymentCardsBloc paymentCardsBloc;

  @override
  void initState() {
    paymentCardsBloc = PaymentCardsBloc();
    cardController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cardController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentCardsBloc,
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: .97,
        widthFactor: 1,
        child: BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
          builder: (context, state) {
            return CustomScreen(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WBottomSheet(
                    hasBackButton: false,
                    contentPadding:
                        EdgeInsets.only(left: 16, top: 14, bottom: 4 + MediaQuery.of(context).padding.bottom),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.leftArrow),
                              const SizedBox(width: 8),
                              Text(
                                LocaleKeys.add_card.tr(),
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const WDivider(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 16, 0),
                            child: DefaultTextField(
                              title: LocaleKeys.number_card.tr(),
                              controller: cardController,
                              hasError: false,
                              onChanged: (value) {
                                setState(() {});
                              },
                              prefix: Padding(
                                padding: const EdgeInsets.only(left: 12, right: 8),
                                child: SvgPicture.asset(AppIcons.creditCard),
                              ),
                              hintText: LocaleKeys.enter_card_number.tr(),
                              keyboardType: TextInputType.number,
                              inputFormatters: [cardNumberFormatter],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: DefaultTextField(
                              title: LocaleKeys.card_term.tr(),
                              controller: dateController,
                              hasError: false,
                              onChanged: (value) {
                                setState(() {});
                              },
                              prefix: Padding(
                                padding: const EdgeInsets.only(left: 12, right: 8),
                                child: SvgPicture.asset(AppIcons.clock),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [cardExpirationDateFormatter],
                              hintText: LocaleKeys.enter_card_term.tr(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          WButton(
                            isDisabled: !(cardController.text.length == 19 && dateController.text.length == 5),
                            isLoading: state.secondStatus.isSubmissionInProgress,
                            onTap: () {
                              final creatCardParam = CreateCardParam(
                                cardNumber: cardController.text.replaceAll(' ', ''),
                                expireDate: dateController.text.replaceAll('/', ''),
                              );
                              context.read<PaymentCardsBloc>().add(CreatePaymentCardEvent(
                                    param: creatCardParam,
                                    onSucces: () {
                                      widget.onAddCardSuccess(creatCardParam);
                                    },
                                    onError: (message) {
                                      context.read<ShowPopUpBloc>().add(ShowPopUp(message: message, isSuccess: false));
                                    },
                                  ));
                            },
                            height: 40,
                            disabledColor: textSecondary,
                            margin: EdgeInsets.only(
                              bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                              right: 16,
                            ),
                            text: LocaleKeys.apply.tr(),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static final cardNumberFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'\d')}, type: MaskAutoCompletionType.lazy);

  static final cardExpirationDateFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'\d')}, type: MaskAutoCompletionType.lazy);
}
