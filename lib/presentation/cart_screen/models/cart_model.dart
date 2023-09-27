import 'package:get/get.dart';
import 'cart_item_model.dart';

/// This class defines the variables used in the [cart_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CartModel {
  Rx<List<CartItemModel>> cartItemList =
      Rx(List.generate(2, (index) => CartItemModel()));
}
