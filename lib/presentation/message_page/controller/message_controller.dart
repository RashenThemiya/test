import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/message_page/models/message_model.dart';

/// A controller class for the MessagePage.
///
/// This class manages the state of the MessagePage, including the
/// current messageModelObj
class MessageController extends GetxController {
  MessageController(this.messageModelObj);

  Rx<MessageModel> messageModelObj;
}
