import '../controller/settigns_controller.dart';
import '../models/settigns_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class SettignsItemWidget extends StatelessWidget {
  SettignsItemWidget(
    this.settignsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SettignsItemModel settignsItemModelObj;

  var controller = Get.find<SettignsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(63),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgLocationPrimary,
            height: getSize(32),
            width: getSize(32),
          ),
          Padding(
            padding: getPadding(
              top: 4,
            ),
            child: Obx(
              () => Text(
                settignsItemModelObj.heartrateTxt.value,
                style: theme.textTheme.labelMedium,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 2,
            ),
            child: Obx(
              () => Text(
                settignsItemModelObj.heartratecountTxt.value,
                style: CustomTextStyles.titleMediumPrimary_1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
