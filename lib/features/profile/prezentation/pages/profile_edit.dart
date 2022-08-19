import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/show_cupertino_date_picker.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController nameController;
  late TextEditingController soNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  DateTime date = DateTime.now();

  @override
  initState() {
    nameController = TextEditingController(text: 'Мухаммадамин');
    soNameController = TextEditingController(text: 'Домлахонов');
    phoneController = TextEditingController(text: '+998 91 120 20 86');
    emailController = TextEditingController(text: 'domlahonov@gmail.com');
    super.initState();
  }

  @override
  dispose() {
    nameController.dispose();
    soNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return KeyboardDismisser(
      child: Scaffold(
        appBar: const WAppBar(title: 'Редактировать'),
        bottomNavigationBar: WButton(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 12 + mediaQuery.padding.bottom),
          text: 'Сохранить',
          onTap: () {},
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 12 + mediaQuery.padding.bottom),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [ProfileImage()],
              ),
              const SizedBox(height: 28),
              WTextField(
                controller: nameController,
                onChanged: (v) {},
                title: 'Имя',
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.user, color: primary),
                ),
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: soNameController,
                onChanged: (v) {},
                title: 'Фамилия',
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.user, color: primary),
                ),
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: phoneController,
                onChanged: (v) {},
                title: 'Номер телефона',
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.phone, color: primary),
                ),
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: emailController,
                onChanged: (v) {},
                title: 'Email',
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: SvgPicture.asset(AppIcons.at, color: primary),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Дата рождения',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  showCupertinoDatePicker(context, (date) {
                    setState(() {
                      this.date = date;
                    });
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lilyWhite,
                  ),
                  child: Row(
                    children: [
                      Text(
                        MyFunctions.formatBirthDate(date),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppIcons.calendar),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
