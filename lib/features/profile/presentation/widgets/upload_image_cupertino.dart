import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class UpLoadImageCupertino extends StatelessWidget {
  final VoidCallback onTapGallery;
  final VoidCallback onTapCamera;

  const UpLoadImageCupertino(
      {required this.onTapCamera, required this.onTapGallery, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(LocaleKeys.send_file.tr()),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: onTapGallery,
          child: Text(
            LocaleKeys.select_gallery.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.38,
                color: Colors.blue),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: onTapCamera,
          child: Text(
            LocaleKeys.camera.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.38,
                color: Colors.blue),
          ),
        )
      ],
    );
  }
}
