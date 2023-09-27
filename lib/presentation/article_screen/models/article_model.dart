import 'package:get/get.dart';
import 'article_item_model.dart';

/// This class defines the variables used in the [article_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArticleModel {
  Rx<List<ArticleItemModel>> articleItemList =
      Rx(List.generate(2, (index) => ArticleItemModel()));
}
