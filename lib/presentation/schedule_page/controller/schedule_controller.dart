import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/schedule_page/models/schedule_model.dart';

/// A controller class for the SchedulePage.
///
/// This class manages the state of the SchedulePage, including the
/// current scheduleModelObj
class ScheduleController extends GetxController {
  ScheduleController(this.scheduleModelObj);

  Rx<ScheduleModel> scheduleModelObj;
}
