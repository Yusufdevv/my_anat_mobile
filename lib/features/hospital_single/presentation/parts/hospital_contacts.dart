import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/domain/entities/contact_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/contacts_container.dart';
import 'package:anatomica/features/map/presentation/widgets/phones_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalContacts extends StatefulWidget {
  final String phone;

  final String email;

  final String website;

  final String instagram;
  final String facebook;
  final String telegram;

  const HospitalContacts(
      {required this.email,
      required this.facebook,
      req,
      required this.telegram,
      required this.instagram,
      required this.website,
      required this.phone,
      Key? key})
      : super(key: key);

  @override
  State<HospitalContacts> createState() => _HospitalContactsState();
}

class _HospitalContactsState extends State<HospitalContacts> {
  List<ContactEntity> contacts = [];
  List<ContactEntity> socials = [];

  launchDefault(String url) async {
    await canLaunchUrl(Uri.parse( url))
        ? await launchUrl(Uri.parse( url))
        : throw 'can not open url';
  }

  @override
  void initState() {
    contacts = [
      ContactEntity(
          icon: AppIcons.boldPhone, content: widget.phone, onTap: () {
        launchDefault('tel:${widget.phone}');
      }),
      ContactEntity(icon: AppIcons.mail, content: widget.email, onTap: () {
        launchDefault('mailto:${widget.email}');
      }),
      ContactEntity(
          icon: AppIcons.website, content: widget.website, onTap: () {
        launchDefault(widget.website);
      }),
    ];

    socials = [
      ContactEntity(
          icon: AppIcons.instagram,
          content: 'instagram.com/${widget.instagram}',
          onTap: () {
            launchDefault('https://instagram.com/${widget.instagram}');
          }),
      ContactEntity(
          icon: AppIcons.facebook,
          content: 'facebook.com/${widget.facebook}',
          onTap: () {
            launchDefault('https://facebook.com/${widget.facebook}');
          }),
      ContactEntity(
          icon: AppIcons.telegram,
          content: 't.me/${widget.telegram}',
          onTap: () {
            launchDefault('https://t.me/${widget.telegram}');
          }),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16)
          .copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
      children: [
        ContactsContainer(contacts: contacts),
        const SizedBox(
          height: 16,
        ),
        ContactsContainer(contacts: socials),
        const SizedBox(
          height: 20,
        ),
        WButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const PhonesBottomSheet(),
            );
          },
          text: LocaleKeys.call.tr(),
        )
      ],
    );
  }
}
