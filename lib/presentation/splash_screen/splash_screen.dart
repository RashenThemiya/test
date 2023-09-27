import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/widgets/custom_elevated_button.dart';
import 'package:mhart_s_application3/widgets/custom_outlined_button.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.cyan300,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 17, top: 46, right: 17, bottom: 46),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      CustomImageView(
                          imagePath: ImageConstant.imgHidoclogo,
                          height: getVerticalSize(368),
                          width: getHorizontalSize(338)),
                      CustomOutlinedButton(
                          text: "lbl_login".tr,
                          margin: getMargin(left: 3, top: 87, right: 3),
                          onTap: () {
                            onTapLogin();
                          }),
                      CustomElevatedButton(
                          text: "lbl_sign_up".tr,
                          margin: getMargin(left: 3, top: 15, right: 3),
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles.titleSmallTeal300,
                          onTap: () {
                            onTapSignup();
                          })
                    ]))));
  }

  /// Navigates to the loginScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the loginScreen.
  onTapLogin() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupScreen.
  onTapSignup() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
