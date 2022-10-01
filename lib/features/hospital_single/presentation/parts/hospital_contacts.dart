import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/domain/entities/contact_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/contacts_container.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/phones_bottom_sheet.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HospitalContacts extends StatefulWidget {
  final String phone;
  final String email;
  final String website;
  final String instagram;
  final String facebook;
  final String telegram;
  final List<String> phoneNumbers;

  const HospitalContacts({
    this.email = '',
    this.facebook = '',
    this.phoneNumbers = const [],
    this.telegram = '',
    this.instagram = '',
    this.website = '',
    this.phone = '',
    Key? key,
  }) : super(key: key);

  @override
  State<HospitalContacts> createState() => _HospitalContactsState();
}

class _HospitalContactsState extends State<HospitalContacts> {
  List<ContactEntity> contacts = [];
  List<ContactEntity> socials = [];

  launchDefault(String url) async {
    await canLaunchUrl(Uri.parse(url))
        ? await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        : throw 'can not open url';
  }

  @override
  void initState() {
    if (widget.phone.isNotEmpty) {
      contacts.add(ContactEntity(
          icon: AppIcons.boldPhone,
          content: MyFunctions.formatPhone(widget.phone, false),
          onTap: () {
            launchDefault('tel:${widget.phone}');
          }));
    }
    if (widget.email.isNotEmpty) {
      contacts.add(ContactEntity(
          icon: AppIcons.mail,
          content: widget.email,
          onTap: () {
            launchDefault('mailto:${widget.email}');
          }));
    }
    if (widget.website.isNotEmpty) {
      contacts.add(
        ContactEntity(
          icon: AppIcons.website,
          content: widget.website,
          onTap: () {
            launchDefault(widget.website);
          },
        ),
      );
    }
    if (widget.instagram.isNotEmpty) {
      socials.add(ContactEntity(
          icon: AppIcons.instagram,
          content: 'instagram.com/${widget.instagram}',
          onTap: () {
            launchDefault('https://instagram.com/${widget.instagram}');
          }));
    }
    if (widget.facebook.isNotEmpty) {
      socials.add(ContactEntity(
          icon: AppIcons.facebook,
          content: 'facebook.com/${widget.facebook}',
          onTap: () {
            launchDefault('https://facebook.com/${widget.facebook}');
          }));
    }
    if (widget.telegram.isNotEmpty) {
      socials.add(ContactEntity(
          icon: AppIcons.telegram,
          content: 't.me/${widget.telegram}',
          onTap: () {
            launchDefault('https://t.me/${widget.telegram}');
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: contacts.isEmpty && socials.isEmpty
          ? EdgeInsets.zero
          : const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
      children: [
        if (contacts.isEmpty && socials.isEmpty) ...{
          SingleChildScrollView(
            child: EmptyWidget(
              title: LocaleKeys.no_contacts.tr(),
              content: LocaleKeys.no_contacts_in_this_hospital.tr(),
            ),
          )
        } else ...{
          if (contacts.isNotEmpty) ...[
            ContactsContainer(contacts: contacts),
            const SizedBox(height: 16),
          ],
          if (socials.isNotEmpty) ...[
            ContactsContainer(contacts: socials),
            const SizedBox(
              height: 20,
            ),
          ],
          if (widget.phoneNumbers.isNotEmpty || widget.phone.isNotEmpty) ...{
            WButton(
              onTap: () async {
                print(widget.phoneNumbers.length);
                if (widget.phoneNumbers.length > 1) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => PhonesBottomSheet(
                      phones: widget.phoneNumbers,
                    ),
                  );
                } else {
                  if (widget.phone.isNotEmpty) {
                    if (await canLaunchUrlString('tel:${widget.phone}')) {
                      await launchUrlString('tel:${widget.phone}');
                    } else {
                      throw 'Can not open phone number';
                    }
                  }
                }
              },
              text: LocaleKeys.call.tr(),
            )
          }
        }
      ],
    );
  }
}
