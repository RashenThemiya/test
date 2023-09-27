import 'package:get/get.dart';
import 'dr_list_item_model.dart';

/// This class defines the variables used in the [dr_list_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DrListModel {
  Rx<List<DrListItemModel>> drListItemList =
      Rx(List.generate(4, (index) => DrListItemModel()));
}
