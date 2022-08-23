import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/map/domain/entities/contact_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsContainer extends StatelessWidget {
  const ContactsContainer({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  final List<ContactEntity> contacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: textFieldColor,
        ),
        color: white,
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            offset: const Offset(0, 8),
            blurRadius: 24,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(
          contacts.length,
          (index) => ContactItem(
            icon: contacts[index].icon,
            content: contacts[index].content,
            isLast: index == contacts.length - 1,
          ),
        ),
      ),
    );
  }
}
