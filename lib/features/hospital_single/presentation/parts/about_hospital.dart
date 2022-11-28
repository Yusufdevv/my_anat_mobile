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
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                .copyWith(bottom: 0),
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
                if (hospital.description.isEmpty &&
                    hospital.images.isEmpty) ...{
                  EmptyWidget(
                    hasPadding: true,
                    hasMargin: false,
                    title: LocaleKeys.no_info.tr(),
                    content: LocaleKeys.no_info.tr(),
                  )
                } else ...[
                  Html(data: hospital.description),
                ]
              ],
            ),
          ),
          if (hospital.images.isNotEmpty) ...[Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16, top: 20),
            child: Text(
              LocaleKeys.photos.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: textColor),
            ),
          ),
            SizedBox(
              height: 140,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      fade(
                        page: ImageSingleScreen(
                          images: hospital.images,
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: WImage(
                    imageUrl: hospital.images[index].middle,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.shortestSide / 2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                itemCount: hospital.images.length,
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(bottom: 20),
              ),
            ),]

        ],
      ),
    );
  }
}
