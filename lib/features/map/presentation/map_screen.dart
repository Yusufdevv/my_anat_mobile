import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  late YandexMapController _mapController;
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WKeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 64,
          titleSpacing: 16,
          title: SvgPicture.asset(
            AppIcons.mainLogo,
            height: 20,
          ),
        ),
        body: Stack(
          children: [
            YandexMap(
              rotateGesturesEnabled: false,
              onCameraPositionChanged: (cameraPosition, updateReason, _) {},
              onMapTap: (point) {
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
              },
              onMapCreated: (controller) async {
                _mapController = controller;
                final position = await _determinePosition();
                _mapController.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: Point(latitude: position.latitude, longitude: position.longitude),
                    ),
                  ),
                  animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                );
              },
            ),
            Positioned(
              left: 16,
              right: 16,
              top: 16,
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(2),
                child: TabBar(
                  controller: _controller,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelStyle: Theme.of(context).textTheme.headline3,
                  labelColor: textColor,
                  unselectedLabelColor: textSecondary,
                  tabs: const [
                    Tab(text: 'Организации'),
                    Tab(text: 'Врачи'),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).padding.bottom - 28,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MapButton.defaultButton(title: 'Списком', onTap: () {}),
                        MapControllerButtons(
                          onCurrentLocationTap: () async {
                            final position = await _determinePosition();
                            _mapController.moveCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: Point(latitude: position.latitude, longitude: position.longitude),
                                ),
                              ),
                              animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                            );
                          },
                          onMinusTap: () {
                            _mapController.moveCamera(
                              CameraUpdate.zoomOut(),
                              animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                            );
                          },
                          onPlusTap: () {
                            _mapController.moveCamera(
                              CameraUpdate.zoomIn(),
                              animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: 12),
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => MapButton.chip(title: 'Стомотология', onTap: () {}),
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 43),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: textFieldColor),
                      color: white,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          fillColor: textFieldColor,
                          filled: true,
                          suffixIconConstraints: const BoxConstraints(maxWidth: 40),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
                            child: Center(
                              child: SvgPicture.asset(AppIcons.search),
                            ),
                          ),
                          hintText: 'Поиск',
                          hintStyle: Theme.of(context).textTheme.headline3,
                          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
                          suffixIcon: WScaleAnimation(
                              onTap: () {},
                              child: Padding(
                                  padding: const EdgeInsets.all(10), child: SvgPicture.asset(AppIcons.clearRounded))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: textFieldColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: textFieldColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: primary),
                          ),
                        ),
                      ),
                    ),
                    // WScaleAnimation(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: const EdgeInsets.all(10),
                    //     decoration: BoxDecoration(
                    //       color: textFieldColor,
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         SvgPicture.asset(AppIcons.search),
                    //         const SizedBox(width: 6),
                    //         Text(
                    //           'Поиск',
                    //           style: Theme.of(context).textTheme.headline3,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}

class MapControllerButtons extends StatelessWidget {
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;
  final VoidCallback onCurrentLocationTap;

  const MapControllerButtons({
    required this.onCurrentLocationTap,
    required this.onMinusTap,
    required this.onPlusTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                color: chipShadowColor.withOpacity(0.19),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              WScaleAnimation(
                onTap: onPlusTap,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.plusIcon),
                ),
              ),
              Container(
                height: 1,
                width: 28,
                color: textColor.withOpacity(0.1),
              ),
              WScaleAnimation(
                onTap: onMinusTap,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.minusIcon),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        WScaleAnimation(
          onTap: onCurrentLocationTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  color: chipShadowColor.withOpacity(0.19),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(AppIcons.currentLocation),
          ),
        )
      ],
    );
  }
}
