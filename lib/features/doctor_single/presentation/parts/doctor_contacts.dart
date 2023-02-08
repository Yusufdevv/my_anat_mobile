import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/map/domain/entities/contact_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/contacts_container.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DoctorContacts extends StatefulWidget {
  final DoctorSingleEntity doctorSingle;
  const DoctorContacts({required this.doctorSingle, Key? key}) : super(key: key);

  @override
  State<DoctorContacts> createState() => _DoctorContactsState();
}

class _DoctorContactsState extends State<DoctorContacts> {
  List<ContactEntity> contacts = [];
  List<ContactEntity> socials = [];

  launchDefault(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'can not open url';
    }
  }

  @override
  void initState() {
    if (widget.doctorSingle.phoneNumbers.isNotEmpty) {
      contacts.addAll(List.generate(widget.doctorSingle.phoneNumbers.length, (index) => ContactEntity(
          icon: AppIcons.boldPhone,
          content: MyFunctions.formatPhone(widget.doctorSingle.phoneNumbers[index].phoneNumber, false),
          onTap: () {
            launchDefault('tel:${widget.doctorSingle.phoneNumbers[index].phoneNumber.replaceAll('+', '')}');
          },),),);
    }
    if (widget.doctorSingle.email.isNotEmpty) {
      contacts.add(ContactEntity(
          icon: AppIcons.mail,
          content: widget.doctorSingle.email,
          onTap:  () {
            launchDefault('mailto:${widget.doctorSingle.email}');
          }));
    }

    if (widget.doctorSingle.instagram.isNotEmpty) {
      socials.add(ContactEntity(
          icon: AppIcons.instagram,
          content: 'instagram.com/${widget.doctorSingle.instagram}',
          onTap: () {
            launchDefault('https://instagram.com/${widget.doctorSingle.instagram}');
          }));
    }

    if (widget.doctorSingle.telegram.isNotEmpty) {
      socials.add(ContactEntity(
          icon: AppIcons.telegram,
          content: 't.me/${widget.doctorSingle.telegram}',
          onTap: () {
            launchDefault('https://t.me/${widget.doctorSingle.telegram}');
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
      children: [
        ContactsContainer(contacts: contacts),
        const SizedBox(
          height: 20,
        ),
        if (widget.doctorSingle.phoneNumbers.isNotEmpty) ...{
          WButton(
            onTap: () async {
              if (widget.doctorSingle.phoneNumbers.isNotEmpty) {
                if (await canLaunchUrlString('tel:${widget.doctorSingle.phoneNumbers.first.phoneNumber}')) {
                  await launchUrlString('tel:${widget.doctorSingle.phoneNumbers.first.phoneNumber}');
                } else {
                  throw 'Can not open phone number';
                }
              }
            },
            text: LocaleKeys.call.tr(),
          )
        }

      ],
    );
  }
}
