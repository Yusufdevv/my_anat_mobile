import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneTimeExpect extends StatelessWidget {
  final bool isRegistered;
  final PaymentBloc bloc;
  const OneTimeExpect({required this.bloc, required this.isRegistered, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              centerTitle: true,
              shadowColor: textFieldColor,
              titleSpacing: 0,
              leadingWidth: 0,
              automaticallyImplyLeading: false,
              title: Text(
                isRegistered ? 'Покупка журнала' : LocaleKeys.only_pay.tr(),
                style: Theme.of(context).textTheme.headline1,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: WScaleAnimation(
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: SvgPicture.asset(
                      AppIcons.close,
                      color: black,
                    ),
                  ),
                )
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.expect),
                  const SizedBox(height: 16),
                  Text(
                    LocaleKeys.expect.tr(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    LocaleKeys.realization_expect.tr(),
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: WButton(
              margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16, left: 16, right: 16),
              onTap: () {
                context.read<PaymentBloc>().add(CheckPaymentStatus());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.refresh),
                  const SizedBox(width: 8),
                  Text(LocaleKeys.update_page.tr())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
