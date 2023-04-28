import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/map_controller_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  final TextEditingController searchController;
  final MediaQueryData mediaQuery;
  final TabController tabController;
  final MapOrganizationBloc mapOrganizationBloc;
  final Function(Point) onMapCreateSuccess;

  const MapScreen(
      {required this.mediaQuery,
      required this.tabController,
      required this.searchController,
      required this.mapOrganizationBloc,
      required this.onMapCreateSuccess,
      Key? key})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapOrganizationBloc, MapOrganizationState>(
      listenWhen: (state1, state2) {
        return state1.searchText != state2.searchText ||
            state1.radius != state2.radius ||
            state1.long != state2.long ||
            state1.lat != state2.lat;
      },
      listener: (context, state) {
        widget.searchController.text = state.searchText;
        widget.mapOrganizationBloc.add(MapGetDoctorsEvent(context: context));
        widget.mapOrganizationBloc.add(MapGetHospitalsEvent(context: context));
      },
      builder: (context, state) {
        return Stack(
          children: [
            /// Yandex Map
            Positioned.fill(
              bottom: widget.mediaQuery.viewInsets.bottom,
              top: -24,
              child: YandexMap(
                rotateGesturesEnabled: false,
                onCameraPositionChanged: (cameraPosition, updateReason, isStopped) async {
                  if (isStopped) {
                    widget.mapOrganizationBloc.add(MapChooseEvent(
                        lat: cameraPosition.target.latitude,
                        long: cameraPosition.target.longitude,
                        radius: MyFunctions.getRadiusFromZoom(cameraPosition.zoom).floor()));
                  }
                },
                onMapTap: (point) {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                },
                mapObjects: state.mapObjects,
                onMapCreated: (controller) async {
                  widget.mapOrganizationBloc.add(
                    MapOnCreateEvent(
                      onSuccess: widget.onMapCreateSuccess,
                      context: context,
                      controller: controller,
                    ),
                  );
                },
              ),
            ),

            /// Under Tab Bar LinearGradient
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                height: widget.mediaQuery.padding.top + 84,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [white.withOpacity(0.65), white.withOpacity(0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            ///   Controller buttons
            Positioned(
              right: 0,
              bottom: widget.mediaQuery.padding.bottom - 28,
              child: BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
                builder: (context, loginState) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    child: !loginState.showMainTab
                        ? const SizedBox()
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 136),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(),
                                    MapControllerButtons(
                                      onCurrentLocationTap: () async {
                                        context.read<MapOrganizationBloc>().add(
                                              MapGetCurrentLocationEvent(
                                                context: context,
                                                onError: (message) {
                                                  context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                                                },
                                              ),
                                            );
                                      },
                                      onMinusTap: () => widget.mapOrganizationBloc.add(MapZoomOut()),
                                      onPlusTap: () => widget.mapOrganizationBloc.add(MapZoomIn()),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ),

            /// Unnecassary Container
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                height: widget.mediaQuery.padding.top + 84,
              ),
            ),

            /// Loading widget
            if (state.tabChangingStatus.isSubmissionInProgress)
              Positioned.fill(
                right: 0,
                left: 0,
                top: 0,
                child: Container(
                  color: Colors.black26,
                  height: widget.mediaQuery.padding.top + 84,
                  child: const CupertinoActivityIndicator(
                    color: Colors.black,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
