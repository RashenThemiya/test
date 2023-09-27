import 'package:get/get.dart';
import 'settigns_item_model.dart';

/// This class defines the variables used in the [settigns_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SettignsModel {
  Rx<List<SettignsItemModel>> settignsItemList =
      Rx(List.generate(3, (index) => SettignsItemModel()));
}
