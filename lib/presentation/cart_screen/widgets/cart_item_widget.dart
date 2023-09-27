import '../controller/cart_controller.dart';
import '../models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class CartItemWidget extends StatelessWidget {
  CartItemWidget(
    this.cartItemModelObj, {
    Key? key,
    this.onTapRowobhcombi,
  }) : super(
          key: key,
        );

  CartItemModel cartItemModelObj;

  var controller = Get.find<CartController>();

  VoidCallback? onTapRowobhcombi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowobhcombi?.call();
      },
      child: Container(
        padding: getPadding(
          all: 14,
        ),
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse27image,
              height: getSize(72),
              width: getSize(72),
              margin: getMargin(
                top: 10,
                bottom: 9,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 42,
                top: 2,
                bottom: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      cartItemModelObj.obhcombiTxt.value,
                      style: CustomTextStyles.titleMedium18,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 3,
                    ),
                    child: Obx(
                      () => Text(
                        cartItemModelObj.measurementTxt.value,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 25,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCarErrorcontainer,
                          height: getSize(18),
                          width: getSize(18),
                          margin: getMargin(
                            top: 1,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                          ),
                          child: Text(
                            "lbl_1".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgPlus,
                          height: getSize(18),
                          width: getSize(18),
                          margin: getMargin(
                            left: 13,
                            top: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 33,
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgTrash,
                    height: getSize(18),
                    width: getSize(18),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 47,
                    ),
                    child: Text(
                      "lbl_9_99".tr,
                      style: CustomTextStyles.titleMedium18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
