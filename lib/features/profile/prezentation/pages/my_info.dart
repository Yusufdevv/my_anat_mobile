import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/prezentation/pages/profile_edit.dart';
import 'package:anatomica/features/profile/prezentation/widgets/info_item.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const WAppBar(title: 'Мои данные', hasUnderline: true),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + mediaQuery.padding.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProfileImage(
                    url:
                        'https://media.istockphoto.com/photos/young-woman-applying-cosmetic-white-cream-on-her-face-picture-id1300104968?b=1&k=20&m=1300104968&s=170667a&w=0&h=DOPJmInw-pSrhFJgxA6wONIUpNjxfkRMbXLbWdY_vv4='),
              ],
            ),
            const SizedBox(height: 24),
            const InfoItem(title: 'Имя', subTitle: 'Шохрух Бахтияров'),
            const SizedBox(height: 20),
            const InfoItem(title: 'Номер телефона', subTitle: '+998 (99) 973-72-60'),
            const SizedBox(height: 20),
            const InfoItem(title: 'Логин', subTitle: 'medion.h'),
            const SizedBox(height: 20),
            const InfoItem(title: 'Электронная почта', subTitle: 'sh.bakhtiyarov@uic.group'),
            const Spacer(),
            WButton(
              text: 'Редактировать',
              onTap: () {
                Navigator.of(context).push(fade(page: const ProfileEditScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
