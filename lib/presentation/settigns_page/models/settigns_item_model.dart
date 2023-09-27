import 'package:get/get.dart';

/// This class is used in the [settigns_item_widget] screen.
class SettignsItemModel {
  Rx<String> heartrateTxt = Rx("Heart rate");

  Rx<String> heartratecountTxt = Rx("215bpm");

  Rx<String>? id = Rx("");
}
