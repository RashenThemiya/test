import 'controller/schedule_tab_container_controller.dart';
import 'models/schedule_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/schedule_page/schedule_page.dart';
import 'package:mhart_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:mhart_s_application3/widgets/app_bar/custom_app_bar.dart';

class ScheduleTabContainerPage extends StatelessWidget {
  ScheduleTabContainerPage({Key? key})
      : super(
          key: key,
        );

  ScheduleTabContainerController controller =
      Get.put(ScheduleTabContainerController(ScheduleTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: CustomAppBar(
          title: AppbarTitle(
            text: "lbl_schedule".tr,
            margin: getMargin(
              left: 21,
            ),
          ),
          actions: [
            Container(
              height: getVerticalSize(27),
              width: getHorizontalSize(24),
              margin: getMargin(
                left: 20,
                top: 13,
                right: 20,
                bottom: 16,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgMoreicon,
                    height: getVerticalSize(16),
                    width: getHorizontalSize(4),
                    alignment: Alignment.topRight,
                    margin: getMargin(
                      left: 20,
                      bottom: 11,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgIconlylightnotification,
                    height: getSize(24),
                    width: getSize(24),
                    alignment: Alignment.center,
                    margin: getMargin(
                      top: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(46),
                width: getHorizontalSize(335),
                margin: getMargin(
                  top: 29,
                ),
                decoration: BoxDecoration(
                  color: appTheme.blueGray50,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(8),
                  ),
                ),
                child: TabBar(
                  controller: controller.tabviewController,
                  isScrollable: true,
                  labelColor: theme.colorScheme.primary,
                  labelStyle: TextStyle(
                    fontSize: getFontSize(14),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor: theme.colorScheme.primaryContainer,
                  unselectedLabelStyle: TextStyle(
                    fontSize: getFontSize(14),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  indicator: BoxDecoration(
                    color: appTheme.cyan300,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(8),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "lbl_upcoming".tr,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_completed".tr,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_canceled".tr,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: getVerticalSize(575),
                  child: TabBarView(
                    controller: controller.tabviewController,
                    children: [
                      SchedulePage(),
                      SchedulePage(),
                      SchedulePage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
