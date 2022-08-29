import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:flutter/material.dart';

class OneTimePaymentTabs extends StatefulWidget {
  final MagazineItemEntity magazineItemEntity;
  final VoidCallback onTap;

  const OneTimePaymentTabs({required this.magazineItemEntity, required this.onTap, Key? key}) : super(key: key);

  @override
  State<OneTimePaymentTabs> createState() => _OneTimePaymentTabsState();
}

class _OneTimePaymentTabsState extends State<OneTimePaymentTabs> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? isConnected = true;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Номер телефона',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(height: 8),
          PhoneTextField(
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
