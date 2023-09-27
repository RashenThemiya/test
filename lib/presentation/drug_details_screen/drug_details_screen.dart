import 'controller/drug_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_image_1.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:mhart_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mhart_s_application3/widgets/custom_elevated_button.dart';
import 'package:mhart_s_application3/widgets/custom_icon_button.dart';
import 'package:mhart_s_application3/widgets/custom_rating_bar.dart';
import 'package:readmore/readmore.dart';

class DrugDetailsScreen extends GetWidget<DrugDetailsController> {
  const DrugDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(45),
                leading: AppbarImage1(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 21, top: 16, bottom: 16),
                    onTap: () {
                      onTapArrowleftone();
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_drugs_detail".tr),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgCart,
                      margin:
                          getMargin(left: 20, top: 16, right: 20, bottom: 16),
                      onTap: () {
                        onTapCartone();
                      })
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 48, right: 20, bottom: 48),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse27image,
                          height: getSize(147),
                          width: getSize(147),
                          alignment: Alignment.center),
                      Padding(
                          padding: getPadding(top: 62),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_obh_combi".tr,
                                          style: theme.textTheme.titleLarge),
                                      Padding(
                                          padding: getPadding(top: 7),
                                          child: Text("lbl_75ml".tr,
                                              style: CustomTextStyles
                                                  .titleMediumErrorContainer)),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: Row(children: [
                                            CustomRatingBar(
                                                margin: getMargin(
                                                    top: 1, bottom: 1),
                                                initialRating: 0),
                                            Padding(
                                                padding: getPadding(left: 5),
                                                child: Text("lbl_4_0".tr,
                                                    style: CustomTextStyles
                                                        .titleSmallCyan300))
                                          ]))
                                    ]),
                                CustomImageView(
                                    svgPath: ImageConstant.imgFavorite,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(top: 28, bottom: 27))
                              ])),
                      Padding(
                          padding: getPadding(top: 29),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgCarErrorcontainer,
                                height: getSize(32),
                                width: getSize(32)),
                            Padding(
                                padding: getPadding(left: 23),
                                child: Text("lbl_1".tr,
                                    style: theme.textTheme.headlineSmall)),
                            CustomImageView(
                                svgPath: ImageConstant.imgPlus,
                                height: getSize(32),
                                width: getSize(32),
                                margin: getMargin(left: 29)),
                            Spacer(),
                            Text("lbl_9_99".tr,
                                style: theme.textTheme.headlineMedium)
                          ])),
                      Padding(
                          padding: getPadding(top: 39),
                          child: Text("lbl_description".tr,
                              style: theme.textTheme.titleMedium)),
                      Container(
                          width: getHorizontalSize(331),
                          margin: getMargin(top: 10, bottom: 5),
                          child: ReadMoreText("msg_obh_combi_is_a".tr,
                              trimLines: 4,
                              colorClickableText: appTheme.cyan300,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "lbl_read_more".tr,
                              moreStyle: theme.textTheme.bodySmall!
                                  .copyWith(height: 1.67),
                              lessStyle: theme.textTheme.bodySmall!
                                  .copyWith(height: 1.67)))
                    ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 20, right: 20, bottom: 28),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomIconButton(
                      height: getSize(50),
                      width: getSize(50),
                      padding: getPadding(all: 13),
                      decoration: IconButtonStyleHelper.fillBlueGray,
                      child: CustomImageView(
                          svgPath: ImageConstant.imgCartCyan300)),
                  Expanded(
                      child: CustomElevatedButton(
                          text: "lbl_buy_now".tr,
                          margin: getMargin(left: 19),
                          onTap: () {
                            onTapBuynow();
                          }))
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the cartScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the cartScreen.
  onTapCartone() {
    Get.toNamed(
      AppRoutes.cartScreen,
    );
  }

  /// Navigates to the cartScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the cartScreen.
  onTapBuynow() {
    Get.toNamed(
      AppRoutes.cartScreen,
    );
  }
}
