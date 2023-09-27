import '../dr_list_screen/widgets/dr_list_item_widget.dart';
import 'controller/dr_list_controller.dart';
import 'models/dr_list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_image_1.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:mhart_s_application3/widgets/app_bar/custom_app_bar.dart';

class DrListScreen extends GetWidget<DrListController> {
  const DrListScreen({Key? key}) : super(key: key);

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
                title: AppbarSubtitle(text: "lbl_top_doctor".tr),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgComponent1,
                      margin: getMargin(all: 20))
                ]),
            body: Padding(
                padding: getPadding(left: 20, top: 24, right: 20),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: controller
                        .drListModelObj.value.drListItemList.value.length,
                    itemBuilder: (context, index) {
                      DrListItemModel model = controller
                          .drListModelObj.value.drListItemList.value[index];
                      return DrListItemWidget(model, onTapRowdrmarcus: () {
                        onTapRowdrmarcus();
                      });
                    })))));
  }

  /// Navigates to the drDetailsScreen when the action is triggered.
  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the drDetailsScreen.
  onTapRowdrmarcus() {
    Get.toNamed(AppRoutes.drDetailsScreen);
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
