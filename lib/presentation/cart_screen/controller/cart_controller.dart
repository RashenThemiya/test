import 'package:mhart_s_application3/core/app_export.dart';
import 'package:mhart_s_application3/presentation/cart_screen/models/cart_model.dart';

/// A controller class for the CartScreen.
///
/// This class manages the state of the CartScreen, including the
/// current cartModelObj
class CartController extends GetxController {
  Rx<CartModel> cartModelObj = CartModel().obs;
}
