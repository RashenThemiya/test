import 'package:get/get.dart';
import 'schedule_item_model.dart';

/// This class defines the variables used in the [schedule_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ScheduleModel {
  Rx<List<ScheduleItemModel>> scheduleItemList =
      Rx(List.generate(2, (index) => ScheduleItemModel()));
}
