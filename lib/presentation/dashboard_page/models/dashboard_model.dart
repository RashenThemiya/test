import 'package:get/get.dart';
import 'dashboard_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel {
  Rx<List<DashboardItemModel>> dashboardItemList =
      Rx(List.generate(4, (index) => DashboardItemModel()));
}
