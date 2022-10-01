import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/candidate_single/candidate_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LicenceItemList extends StatelessWidget {
  final int candidateId;
  const LicenceItemList({required this.candidateId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateSingleBloc, CandidateSingleState>(
      builder: (context, state) {
        if (state.certificateStatus.isPure) {
          context.read<CandidateSingleBloc>().add(CandidateCertificateEvent(id: candidateId));
        } else if (state.certificateStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.certificateStatus.isSubmissionSuccess) {
          if (state.certificateList.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => LicenceItem(entity: state.certificateList[index]),
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
