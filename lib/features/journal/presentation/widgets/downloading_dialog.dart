import 'dart:io';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:munir_epub_reader/epub_viewer.dart';

class DownloadingDialog extends StatelessWidget {
  final BuildContext parentContext;
  final String bookTitle;

  const DownloadingDialog({required this.bookTitle, required this.parentContext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: WScaleAnimation(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  AppIcons.close,
                  color: white,
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.logo,
                    color: white,
                    height: 200,
                  ),
                  const SizedBox(height: 32),
                  Stack(
                    children: [
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      BlocConsumer<DownloadBloc, DownloadState>(
                        listener: (context, state) {
                          if (state.status.isSubmissionSuccess) {
                            Navigator.of(context).pop();
                            if (Platform.isAndroid) {
                              EpubViewer.setConfig(
                                themeColor: Theme.of(context).primaryColor,
                                identifier: 'iosBook',
                                scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                                allowSharing: true,
                                enableTts: true,
                                nightMode: true,
                              );
                              EpubViewer.open(state.fileUrl);
                            }
                          }
                        },
                        builder: (context, state) => AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          height: 8,
                          width: (MediaQuery.of(context).size.width - 40) * state.progress,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
