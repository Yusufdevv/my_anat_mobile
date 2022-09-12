import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class DotTextWidget extends StatelessWidget {
  final int length;
  final String title;

  const DotTextWidget({this.length = 0, this.title = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        length,
        (index) => RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Container(
                  width: 3,
                  height: 3,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: black,
                  ),
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(
                text: title[index],
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
