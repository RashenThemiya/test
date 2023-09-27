import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/settigns_page/models/settigns_model.dart';

/// A controller class for the SettignsPage.
///
/// This class manages the state of the SettignsPage, including the
/// current settignsModelObj
class SettignsController extends GetxController {
  SettignsController(this.settignsModelObj);

  Rx<SettignsModel> settignsModelObj;
}
