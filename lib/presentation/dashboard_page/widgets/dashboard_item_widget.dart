import '../controller/dashboard_controller.dart';
import '../models/dashboard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DashboardItemWidget extends StatelessWidget {
  DashboardItemWidget(
    this.dashboardItemModelObj, {
    Key? key,
    this.onTapDoctor,
  }) : super(
          key: key,
        );

  DashboardItemModel dashboardItemModelObj;

  var controller = Get.find<DashboardController>();

  VoidCallback? onTapDoctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(118),
      child: GestureDetector(
        onTap: () {
          onTapDoctor?.call();
        },
        child: Container(
          padding: getPadding(
            left: 7,
            top: 12,
            right: 7,
            bottom: 12,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse27image,
                height: getSize(68),
                width: getSize(68),
                alignment: Alignment.center,
                margin: getMargin(
                  top: 10,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 1,
                  top: 17,
                ),
                child: Obx(
                  () => Text(
                    dashboardItemModelObj.drmarcushorizoTxt.value,
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 1,
                  top: 4,
                ),
                child: Obx(
                  () => Text(
                    dashboardItemModelObj.chardiologistTxt.value,
                    style: CustomTextStyles.labelSmallBluegray1009,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 1,
                  top: 8,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgStar,
                      height: getSize(10),
                      width: getSize(10),
                      margin: getMargin(
                        bottom: 2,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 3,
                        bottom: 1,
                      ),
                      child: Obx(
                        () => Text(
                          dashboardItemModelObj.rattingTxt.value,
                          style: CustomTextStyles.labelSmallCyan300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 23,
                        top: 2,
                      ),
                      child: Obx(
                        () => Text(
                          dashboardItemModelObj.distanceTxt.value,
                          style: CustomTextStyles.labelSmallBluegray100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
