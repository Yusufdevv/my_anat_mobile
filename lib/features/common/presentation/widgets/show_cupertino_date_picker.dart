import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

void showCupertinoDatePicker(BuildContext context, Function(DateTime) datePicked, DateTime initialDateTime) {
  FocusScope.of(context).unfocus();
  showModalBottomSheet(
    useRootNavigator: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (_) => CupertinoDatePickerWidget(
      datePicked: datePicked,
      initialDateTime: initialDateTime,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: textFieldColor,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          child: DateTimePickerWidget(
            pickerTheme: DateTimePickerTheme(
              cancel: null,
              confirm: null,
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
        ),
        Container(
          color: white,
          child: WButton(
            text: 'Выбрать',
            onTap: () {
              widget.datePicked(initialDateTime ?? DateTime.now());
              Navigator.of(context).pop();
            },
            margin: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          ),
        )
      ],
    );
  }
}
