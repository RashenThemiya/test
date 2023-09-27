import 'controller/dashboard_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/dashboard_page/dashboard_page.dart';
import 'package:mhart_s_application3/presentation/message_page/message_page.dart';
import 'package:mhart_s_application3/presentation/schedule_page/schedule_page.dart';
import 'package:mhart_s_application3/presentation/settigns_page/settigns_page.dart';
import 'package:mhart_s_application3/widgets/custom_bottom_bar.dart';

class DashboardContainerScreen extends GetWidget<DashboardContainerController> {
  const DashboardContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.dashboardPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Messages:
        return AppRoutes.messagePage;
      case BottomBarEnum.Appointment:
        return AppRoutes.schedulePage;
      case BottomBarEnum.Profile:
        return AppRoutes.settignsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage();
      case AppRoutes.messagePage:
        return MessagePage();
      case AppRoutes.schedulePage:
        return SchedulePage();
      case AppRoutes.settignsPage:
        return SettignsPage();
      default:
        return DefaultWidget();
    }
  }
}
