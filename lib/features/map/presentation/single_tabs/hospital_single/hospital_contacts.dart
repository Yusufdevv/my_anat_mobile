import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/domain/entities/contact_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/contacts_container.dart';
import 'package:anatomica/features/map/presentation/widgets/phones_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class HospitalContacts extends StatefulWidget {
  const HospitalContacts({Key? key}) : super(key: key);

  @override
  State<HospitalContacts> createState() => _HospitalContactsState();
}

class _HospitalContactsState extends State<HospitalContacts> {
  final List<List<ContactEntity>> contacts = const [
    [
      ContactEntity(icon: AppIcons.boldPhone, content: '+998 71 200-70-07'),
      ContactEntity(icon: AppIcons.mail, content: '7SSP@anatomica.uz'),
      ContactEntity(icon: AppIcons.website, content: 'anatomica.uz'),
    ],
    [
      ContactEntity(icon: AppIcons.instagram, content: 'instagram.com/7sspuz'),
      ContactEntity(icon: AppIcons.facebook, content: 'facebook.com/7sspuz'),
      ContactEntity(icon: AppIcons.telegram, content: 't.me/7sspuz'),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
      separatorBuilder: (context, index) {
        if (index < contacts.length - 1) {
          return const SizedBox(height: 16);
        } else {
          return const SizedBox(height: 20);
        }
      },
      itemCount: contacts.length + 1,
      itemBuilder: (context, index) {
        if (index < contacts.length) {
          return ContactsContainer(contacts: contacts[index]);
        } else {
          return WButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => PhonesBottomSheet(),
              );
            },
            text: LocaleKeys.call.tr(),
          );
        }
      },
    );
  }
}
