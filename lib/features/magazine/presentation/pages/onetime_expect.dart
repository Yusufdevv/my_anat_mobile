import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneTimeExpect extends StatelessWidget {
  const OneTimeExpect({Key? key}) : super(key: key);

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
            SvgPicture.asset(AppIcons.expect),
            const SizedBox(height: 16),
            Text(
              'Ожидание',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Ваш платеж на покупку журнала\n"Май 2022" в ожидании',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: WButton(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom, left: 16, right: 16),
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.refresh),
            const SizedBox(width: 8),
            const Text('Обновить страницу')
          ],
        ),
      ),
    );
  }
}
