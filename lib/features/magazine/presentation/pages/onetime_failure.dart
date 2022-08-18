import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneTimeFailure extends StatelessWidget {
  const OneTimeFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          shadowColor: textFieldColor,
          titleSpacing: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Единовременный платеж',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: WScaleAnimation(
                onTap: () {
                  Navigator.pop(context);
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
              SvgPicture.asset(AppIcons.failure),
              const SizedBox(height: 16),
              Text(
                'Ошибка :(',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Покупка журнала\n“Май 2022” неуспешно',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 16,
              right: 16),
          child: Row(
            children: [
              Expanded(
                child: WButton(
                  borderRadius: 6,
                  border: Border.all(color: primary),
                  color: unFollowButton,
                  margin: const EdgeInsets.only(top: 12),
                  onTap: () {},
                  child: Text(
                    'В главную',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WButton(
                  margin: const EdgeInsets.only(top: 12),
                  borderRadius: 6,
                  onTap: () {},
                  child: Text(
                    'Повторить попытку',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
