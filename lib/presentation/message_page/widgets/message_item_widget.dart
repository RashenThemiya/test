import '../controller/message_controller.dart';
import '../models/message_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class MessageItemWidget extends StatelessWidget {
  MessageItemWidget(
    this.messageItemModelObj, {
    Key? key,
    this.onTapChat,
  }) : super(
          key: key,
        );

  MessageItemModel messageItemModelObj;

  var controller = Get.find<MessageController>();

  VoidCallback? onTapChat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChat?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDrugthumbnail,
            height: getSize(50),
            width: getSize(50),
          ),
          Expanded(
            child: Padding(
              padding: getPadding(
                left: 15,
                top: 4,
                bottom: 6,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      right: 1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            messageItemModelObj.drmarcushorizonTxt.value,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 89,
                            top: 3,
                          ),
                          child: Obx(
                            () => Text(
                              messageItemModelObj.timeTxt.value,
                              style: CustomTextStyles.bodySmallPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            messageItemModelObj.idonthaveanyTxt.value,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgCheckmark,
                          height: getVerticalSize(9),
                          width: getHorizontalSize(14),
                          margin: getMargin(
                            left: 30,
                            top: 2,
                            bottom: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
