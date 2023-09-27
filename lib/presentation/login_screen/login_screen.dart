import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/core/utils/validation_functions.dart';
import 'package:mhart_s_application3/widgets/custom_elevated_button.dart';
import 'package:mhart_s_application3/widgets/custom_text_form_field.dart';
import 'package:mhart_s_application3/data/models/loginDeviceAuth/post_login_device_auth_req.dart';
import 'package:mhart_s_application3/data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: appTheme.cyan300,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 15, top: 35, right: 15, bottom: 35),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgHidoclogo42x115,
                              height: getVerticalSize(42),
                              width: getHorizontalSize(115),
                              margin: getMargin(top: 70)),
                          Padding(
                              padding: getPadding(top: 24),
                              child: Text("msg_welcome_to_hidoc".tr,
                                  style: CustomTextStyles
                                      .titleMediumPoppinsOnErrorContainer)),
                          Padding(
                              padding: getPadding(top: 11),
                              child: Text("msg_sign_in_to_continue".tr,
                                  style:
                                      CustomTextStyles.bodySmallPoppinsGray50)),
                          CustomTextFormField(
                              controller: controller.emailController,
                              margin: getMargin(top: 28),
                              hintText: "lbl_your_email".tr,
                              hintStyle:
                                  CustomTextStyles.bodySmallPoppinsBluegray300,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 10, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgMail)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              controller: controller.passwordController,
                              margin: getMargin(top: 8),
                              hintText: "lbl_password".tr,
                              hintStyle:
                                  CustomTextStyles.bodySmallPoppinsBluegray300,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 10, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              obscureText: true),
                          CustomElevatedButton(
                              text: "lbl_sign_in".tr,
                              margin: getMargin(top: 27),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallTeal300,
                              onTap: () {
                                onTapSignin();
                              }),
                          Padding(
                              padding: getPadding(top: 23),
                              child: Text("msg_forgot_password".tr,
                                  style: CustomTextStyles
                                      .labelLargePoppinsPrimary)),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount();
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "lbl_register".tr,
                                        style: CustomTextStyles
                                            .labelLargePoppinsPrimaryBold)
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  /// calls the [https://nodedemo.dhiwise.co/device/auth/login] API
  ///
  /// validates the form input fields and executes the API if all the fields are valid
  /// It has [PostLoginDeviceAuthReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onOnTapLoginSuccess()` function.
  /// If the call fails, the function calls the `_onOnTapLoginError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> onTapSignin() async {
    if (_formKey.currentState!.validate()) {
      PostLoginDeviceAuthReq postLoginDeviceAuthReq = PostLoginDeviceAuthReq(
        username: controller.emailController.text,
        password: controller.passwordController.text,
      );
      try {
        await controller.callLoginDeviceAuth(
          postLoginDeviceAuthReq.toJson(),
        );
        _onOnTapLoginSuccess();
      } on PostLoginDeviceAuthResp {
        _onOnTapLoginError();
      } on NoInternetException catch (e) {
        Get.rawSnackbar(message: e.toString());
      } catch (e) {
        //TODO: Handle generic errors
      }
    }
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the dashboardContainerScreen.
  void _onOnTapLoginSuccess() {
    Get.offAllNamed(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onOnTapLoginError() {
    Fluttertoast.showToast(
      msg: "Invalid username or password!",
    );
  }

  /// Navigates to the signupScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupScreen.
  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
