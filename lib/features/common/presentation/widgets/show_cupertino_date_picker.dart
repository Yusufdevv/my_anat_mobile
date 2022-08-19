import 'package:anatomica/features/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

void showCupertinoDatePicker(BuildContext context, Function(DateTime) datePicked) {
  FocusScope.of(context).unfocus();
  showModalBottomSheet(
    useRootNavigator: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    context: context,
    builder: (_) => WBottomSheet(
      contentPadding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      children: [
        DateTimePickerWidget(
          maxDateTime: DateTime.now(),
          locale: DateTimePickerLocale.uz,
          dateFormat: 'dd MMMM yyyy',
          onCancel: () {},
          onConfirm: (value, _) {
            datePicked(value);
            /*setState(() {
              birthDate = value;
            });*/
          },
        ),
      ],
    ),
  );
}
