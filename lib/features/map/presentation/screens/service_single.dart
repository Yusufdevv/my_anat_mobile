import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/material.dart';

class ServiceSingleScreen extends StatelessWidget {
  const ServiceSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HospitalSingleAppBarBody(),
        titleSpacing: 0,
        leadingWidth: 0,
        elevation: 1,
        shadowColor: textFieldColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: white,
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 72),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Text('Bunch of html code here'),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16,
            child: WButton(
              onTap: () {},
              text: 'Заказать услугу',
            ),
          )
        ],
      ),
    );
  }
}
