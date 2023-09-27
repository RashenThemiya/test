import '../message_page/widgets/message_item_widget.dart';
import 'controller/message_controller.dart';
import 'models/message_item_model.dart';
import 'models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  MessageController controller = Get.put(MessageController(MessageModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Expanded(
                          child: SizedBox(
                              width: double.maxFinite,
                              child: Padding(
                                  padding:
                                      getPadding(left: 20, top: 31, right: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Obx(() => ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      height:
                                                          getVerticalSize(24));
                                                },
                                                itemCount: controller
                                                    .messageModelObj
                                                    .value
                                                    .messageItemList
                                                    .value
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  MessageItemModel model =
                                                      controller
                                                          .messageModelObj
                                                          .value
                                                          .messageItemList
                                                          .value[index];
                                                  return MessageItemWidget(
                                                      model, onTapChat: () {
                                                    onTapChat();
                                                  });
                                                }))),
                                        CustomIconButton(
                                            height: getSize(55),
                                            width: getSize(55),
                                            margin: getMargin(top: 237),
                                            padding: getPadding(all: 15),
                                            decoration: IconButtonStyleHelper
                                                .outlineBlack,
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUserPrimary55x55))
                                      ]))))
                    ])))));
  }

  /// Navigates to the chatScreen when the action is triggered.
  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the chatScreen.
  onTapChat() {
    Get.toNamed(AppRoutes.chatScreen);
  }
}
