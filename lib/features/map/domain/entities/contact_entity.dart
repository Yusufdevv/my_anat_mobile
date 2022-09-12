import 'package:flutter/foundation.dart';

class ContactEntity {
  final String icon;
  final String content;
  final VoidCallback onTap;
  const ContactEntity({
    required this.onTap,
    required this.icon,
    required this.content,
  });
}
