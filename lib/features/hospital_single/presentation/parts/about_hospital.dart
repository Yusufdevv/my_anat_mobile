import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/image_single_screen.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutHospital extends StatelessWidget {
  final HospitalSingleEntity hospital;
  const AboutHospital({
    required this.hospital,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.about_clinic.tr(),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: textColor),
          ),
          if (hospital.description.isEmpty && hospital.images.isEmpty) ...{
            EmptyWidget(
              hasPadding: true,
              hasMargin: false,
              title: LocaleKeys.no_info.tr(),
              content: LocaleKeys.no_info.tr(),
            )
          } else ...[
            Html(data: hospital.description),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                  top: hospital.description.isNotEmpty ? 16 : 0),
              shrinkWrap: true,
              itemCount: hospital.images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 88,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(fade(
                      page: ImageSingleScreen(
                    images: hospital.images,
                    index: index,
                  )));
                },
                child: WImage(
                  imageUrl: hospital.images[index].middle,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
