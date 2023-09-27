import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/dr_details_screen/models/dr_details_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the DrDetailsScreen.
///
/// This class manages the state of the DrDetailsScreen, including the
/// current drDetailsModelObj
class DrDetailsController extends GetxController {
  TextEditingController dateController = TextEditingController();

  TextEditingController datetwoController = TextEditingController();

  Rx<DrDetailsModel> drDetailsModelObj = DrDetailsModel().obs;

  @override
  void onClose() {
    super.onClose();
    dateController.dispose();
    datetwoController.dispose();
  }
}
