import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/material.dart';

class HospitalArticleSingle extends StatelessWidget {
  const HospitalArticleSingle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: const HospitalSingleAppBarBody(),
        shadowColor: textFieldColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('bunch of html code'),
      ),
    );
  }
}
