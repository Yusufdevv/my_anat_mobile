import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ServiceSingleScreen extends StatelessWidget {
  final ServicesBloc servicesBloc;
  final String serviceUrl;
  const ServiceSingleScreen({
    Key? key,
    required this.servicesBloc,
    required this.serviceUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: servicesBloc,
      child: Scaffold(
        appBar: AppBar(
          title: HospitalSingleAppBarBody(shareValue: serviceUrl),
          titleSpacing: 0,
          leadingWidth: 0,
          elevation: 1,
          shadowColor: textFieldColor,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: white,
        body: BlocBuilder<ServicesBloc, ServicesState>(
          builder: (context, state) {
            if (state.getSingleServiceStatus.isSubmissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.getSingleServiceStatus.isSubmissionSuccess) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Html(
                        data: state.serviceSingle.content,
                        style: {
                          "h1": Style(fontSize: FontSize.larger),
                          "p": Style(fontSize: FontSize.medium),
                          // "p > a": Style(
                          //   textDecoration: TextDecoration.none,
                          // ),
                          // "#footer": Style(
                          //   display: Display.block,
                          //   whiteSpace: WhiteSpace.pre,
                          //   backgroundColor: Theme.of(context).primaryColor,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    child: WButton(
                      onTap: () async {
                        if (await canLaunchUrlString(state.serviceSingle.url)) {
                          await launchUrlString(state.serviceSingle.url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      text: LocaleKeys.order_service.tr(),
                    ),
                  )
                ],
              );
            } else if (state.getSingleServiceStatus.isSubmissionFailure) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
