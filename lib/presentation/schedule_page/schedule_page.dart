import '../schedule_page/widgets/schedule_item_widget.dart';
import 'controller/schedule_controller.dart';
import 'models/schedule_item_model.dart';
import 'models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key})
      : super(
          key: key,
        );

  ScheduleController controller =
      Get.put(ScheduleController(ScheduleModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillPrimary,
          child: Padding(
            padding: getPadding(
              left: 20,
              top: 30,
              right: 20,
            ),
            child: Obx(
              () => ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: getVerticalSize(20),
                  );
                },
                itemCount: controller
                    .scheduleModelObj.value.scheduleItemList.value.length,
                itemBuilder: (context, index) {
                  ScheduleItemModel model = controller
                      .scheduleModelObj.value.scheduleItemList.value[index];
                  return ScheduleItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
