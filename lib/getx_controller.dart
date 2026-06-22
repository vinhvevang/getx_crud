import 'package:get/get.dart';
import 'package:getx_begin/model.dart';

class getxController extends GetxController {
  final name = "".obs;
  RxnString taxError = RxnString();
  RxnString nameError = RxnString();
  RxnString passWordError = RxnString();
  final RxList<Product> products = <Product>[].obs;
  final RxList<Product> searchProducts = <Product>[].obs;

  void addTask(Product pro) {
    products.add(pro);
    searchProducts.assignAll(products);
  }
  @override
void onInit() {
  super.onInit();
  searchProducts.assignAll(products);
}

  void onDeleted(int j) {
    products.removeAt(j);
    searchProducts.assignAll(products);
  }

  void searchProduct(String keyword) {
    if (keyword.isEmpty) {
      searchProducts.assignAll(products);
      return;
    }

    searchProducts.assignAll(
      products.where((product) {
        return product.name.toLowerCase().contains(keyword.toLowerCase());
      }).toList(),
    );
  }
}
