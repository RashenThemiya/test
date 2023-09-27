import 'controller/ambulance_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_image_1.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:mhart_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mhart_s_application3/widgets/custom_elevated_button.dart';
import 'package:mhart_s_application3/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class AmbulanceScreen extends GetWidget<AmbulanceController> {
  AmbulanceScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(57),
                leadingWidth: getHorizontalSize(45),
                leading: AppbarImage1(
                    svgPath: ImageConstant.imgArrowleftPrimarycontainer,
                    margin: getMargin(left: 21, top: 20, bottom: 17),
                    onTap: () {
                      onTapArrowleftone();
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_ambulance".tr),
                styleType: Style.bgFill),
            body: SizedBox(
                height: getVerticalSize(711),
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                      height: getVerticalSize(710),
                      width: double.maxFinite,
                      child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  37.43296265331129, -122.08832357078792),
                              zoom: 14.4746),
                          onMapCreated: (GoogleMapController controller) {
                            googleMapController.complete(controller);
                          },
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          myLocationButtonEnabled: false,
                          myLocationEnabled: false)),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(
                              left: 10, top: 11, right: 10, bottom: 24),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomSearchView(
                                    controller: controller.searchController,
                                    hintText: "msg_search_location".tr,
                                    hintStyle: theme.textTheme.bodySmall!,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 18,
                                            top: 11,
                                            right: 12,
                                            bottom: 11),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgSearch)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(40)),
                                    suffix: Padding(
                                        padding: EdgeInsets.only(
                                            right: getHorizontalSize(15)),
                                        child: IconButton(
                                            onPressed: () {
                                              controller.searchController
                                                  .clear();
                                            },
                                            icon: Icon(Icons.clear,
                                                color: Colors.grey.shade600))),
                                    borderDecoration:
                                        SearchViewStyleHelper.fillPrimary,
                                    fillColor: theme.colorScheme.primary),
                                CustomImageView(
                                    svgPath: ImageConstant.imgMappointsimage,
                                    height: getVerticalSize(331),
                                    width: getHorizontalSize(355),
                                    margin: getMargin(top: 68)),
                                Spacer(),
                                Container(
                                    padding: getPadding(
                                        left: 10,
                                        top: 14,
                                        right: 10,
                                        bottom: 14),
                                    decoration: AppDecoration.fillPrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding:
                                                  getPadding(top: 4, right: 18),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgLocationRed300,
                                                        height:
                                                            getVerticalSize(26),
                                                        width:
                                                            getHorizontalSize(
                                                                28),
                                                        margin: getMargin(
                                                            top: 4, bottom: 8)),
                                                    Expanded(
                                                        child: Container(
                                                            width:
                                                                getHorizontalSize(
                                                                    255),
                                                            margin: getMargin(
                                                                left: 32),
                                                            child: Text(
                                                                "msg_2640_cabin_creek"
                                                                    .tr,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                        height:
                                                                            1.36))))
                                                  ])),
                                          CustomElevatedButton(
                                              text: "msg_confirm_location".tr,
                                              margin: getMargin(top: 12))
                                        ]))
                              ])))
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
