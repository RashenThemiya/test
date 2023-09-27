import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/book_an_appointment_screen/models/book_an_appointment_model.dart';

/// A controller class for the BookAnAppointmentScreen.
///
/// This class manages the state of the BookAnAppointmentScreen, including the
/// current bookAnAppointmentModelObj
class BookAnAppointmentController extends GetxController {
  Rx<BookAnAppointmentModel> bookAnAppointmentModelObj =
      BookAnAppointmentModel().obs;
}
