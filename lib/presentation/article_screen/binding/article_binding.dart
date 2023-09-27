import '../controller/article_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArticleScreen.
///
/// This class ensures that the ArticleController is created when the
/// ArticleScreen is first loaded.
class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}
