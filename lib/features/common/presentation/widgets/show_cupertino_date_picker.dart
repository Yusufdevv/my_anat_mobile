import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

void showCupertinoDatePicker(BuildContext context, Function(DateTime) datePicked) {
  FocusScope.of(context).unfocus();
  showModalBottomSheet(
    useRootNavigator: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (_) => CupertinoDatePickerWidget(
      datePicked: datePicked,
    ),
  );
}

class CupertinoDatePickerWidget extends StatefulWidget {
  final ValueChanged<DateTime> datePicked;
  final DateTime? initialDateTime;
  const CupertinoDatePickerWidget({
    required this.datePicked,
    this.initialDateTime,
    Key? key,
  }) : super(key: key);

  @override
  State<CupertinoDatePickerWidget> createState() => _CupertinoDatePickerWidgetState();
}

class _CupertinoDatePickerWidgetState extends State<CupertinoDatePickerWidget> {
  DateTime? initialDateTime;
  @override
  void initState() {
    super.initState();
    initialDateTime = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateTimePickerWidget(
            pickerTheme: DateTimePickerTheme(
              cancel: const SizedBox(),
              confirm: const SizedBox(),
              showTitle: false,
              itemTextStyle:
                  Theme.of(context).textTheme.headline4 ?? const TextStyle(color: Color(0xFF000046), fontSize: 16.0),
            ),
            maxDateTime: DateTime.now(),
            locale: DateTimePickerLocale.uz,
            initDateTime: widget.initialDateTime,
            dateFormat: 'dd MMMM yyyy',
            onCancel: () {},
            onChange: (value, _) {
              initialDateTime = value;
            },
          ),
        ],
      ),
    );
  }
}
