import 'dart:io';

import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/utils/download_util.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:open_file_plus/open_file_plus.dart';

class LicenceItemList extends StatefulWidget {
  final int candidateId;
  const LicenceItemList({required this.candidateId, Key? key})
      : super(key: key);

  @override
  State<LicenceItemList> createState() => _LicenceItemListState();
}

class _LicenceItemListState extends State<LicenceItemList> {
  late bool _permissionReady;
  late TargetPlatform? platform;

  @override
  void initState() {
    super.initState();
    _permissionReady = false;
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
      builder: (context, state) {
        if (state.certificateStatus.isPure) {
          context
              .read<CandidateSingleBloc>()
              .add(CandidateCertificateEvent(id: widget.candidateId));
        } else if (state.certificateStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.certificateStatus.isSubmissionSuccess) {
          if (state.certificateList.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                bool isDownloaded = StorageRepository.getBool(
                    state.certificateList[index].file.url,
                    defValue: false);
                return GestureDetector(
                    onTap: () async {
                      _permissionReady =
                          await DownloadUtil().checkPermission(platform);
                      if (!_permissionReady) {
                        return;
                      }
                      var localPath =
                          await DownloadUtil().prepareSaveDir(platform);
                      String savePath =
                          "$localPath/${state.certificateList[index].file.url.split('/').last}";
                      if (isDownloaded) {
                        OpenFile.open(savePath);
                      } else {
                        var downloaded = await DownloadUtil().download(
                            platform,
                            state.certificateList[index].file.url,
                            state.certificateList[index].file.url
                                .split('/')
                                .last);
                        if (downloaded) {
                          OpenFile.open(savePath);
                          await StorageRepository.putBool(
                              key: state.certificateList[index].file.url,
                              value: true);
                        }
                      }
                    },
                    behavior: HitTestBehavior.opaque,
                    child: LicenceItem(entity: state.certificateList[index]));
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: state.certificateList.length,
            );
          } else {
            return EmptyWidget(
              content: LocaleKeys.no_certificates.tr(),
              title: LocaleKeys.no_certificates.tr(),
            );
          }
        } else if (state.certificateStatus.isSubmissionFailure) {
          return const Center(child: Text('Fail'));
        }
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }
}
