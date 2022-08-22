import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpLoadImageCupertino extends StatelessWidget {
  final VoidCallback onTapGallery;
  final VoidCallback onTapCamera;

  const UpLoadImageCupertino({required this.onTapCamera, required this.onTapGallery, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Fayl yuborish'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: Text(
            'Galereyadan tanlash',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.38, color:Colors.blue),
          ),
          onPressed: onTapGallery,
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Kamera',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.38, color: Colors.blue),
          ),
          onPressed: onTapCamera,
        )
      ],
    );
  }
}
