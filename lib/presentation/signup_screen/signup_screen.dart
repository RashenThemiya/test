import 'controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/core/utils/validation_functions.dart';
import 'package:mhart_s_application3/widgets/custom_elevated_button.dart';
import 'package:mhart_s_application3/widgets/custom_text_form_field.dart';
import 'package:mhart_s_application3/data/models/registerDeviceAuth/post_register_device_auth_req.dart';
import 'package:mhart_s_application3/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:mhart_s_application3/core/constants/role.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

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
                              padding: getPadding(top: 25),
                              child: Text("msg_let_s_get_started".tr,
                                  style: CustomTextStyles
                                      .titleMediumPoppinsOnPrimary)),
                          Padding(
                              padding: getPadding(top: 9),
                              child: Text("msg_create_an_new_account".tr,
                                  style: CustomTextStyles
                                      .bodySmallPoppinsPrimary)),
                          CustomTextFormField(
                              controller: controller.fullNameController,
                              margin: getMargin(top: 26),
                              hintText: "lbl_full_name".tr,
                              hintStyle:
                                  CustomTextStyles.bodySmallPoppinsBluegray300,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 10, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgUser)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48)),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              controller: controller.emailController,
                              margin: getMargin(top: 8),
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
                          CustomTextFormField(
                              controller: controller.passwordController1,
                              margin: getMargin(top: 8),
                              hintText: "lbl_password_again".tr,
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
                              text: "lbl_sign_up".tr,
                              margin: getMargin(top: 39),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallTeal300,
                              onTap: () {
                                onTapSignup();
                              }),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                onTapTxtHaveanaccount();
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_have_an".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(
                                        text: "lbl_account".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(
                                        text: "lbl".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "lbl_sign_in2".tr,
                                        style: CustomTextStyles
                                            .labelLargePoppinsPrimaryBold)
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  /// calls the [https://nodedemo.dhiwise.co/device/auth/register] API
  ///
  /// validates the form input fields and executes the API if all the fields are valid
  /// It has [PostRegisterDeviceAuthReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onOnTapSignupSuccess()` function.
  /// If the call fails, the function calls the `_onOnTapSignupError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> onTapSignup() async {
    if (_formKey.currentState!.validate()) {
      PostRegisterDeviceAuthReq postRegisterDeviceAuthReq =
          PostRegisterDeviceAuthReq(
        username: controller.emailController.text,
        email: controller.emailController.text,
        name: controller.fullNameController.text,
        role: Role.user,
      );
      try {
        await controller.callRegisterDeviceAuth(
          postRegisterDeviceAuthReq.toJson(),
        );
        _onOnTapSignupSuccess();
      } on PostRegisterDeviceAuthResp {
        _onOnTapSignupError();
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
  void _onOnTapSignupSuccess() {
    Get.offAllNamed(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onOnTapSignupError() {
    Fluttertoast.showToast(
        msg: controller.postRegisterDeviceAuthResp.message.toString() ?? '');
  }

  /// Navigates to the loginScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the loginScreen.
  onTapTxtHaveanaccount() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
