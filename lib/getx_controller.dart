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
  void FilterProduct(String name) {
  List<Product> result = [];

  for (int i = 0; i < products.length; i++) {
    String productName = products[i].name.toLowerCase();
    int productPrice = products[i].price;

    bool matchName = true;
    bool matchPrice = true;

    if (name.isNotEmpty) {
      matchName = productName.contains(name.toLowerCase());
    }

    // if (price > 0) {
    //   matchPrice = productPrice == price;
    // }

    if (matchName) {
      result.add(products[i]);
    }
  }

  searchProducts.assignAll(result); 
  
  // 🔥 quan trọng
}
  void searchProduct(String keyword) {
    if (keyword.isEmpty) {
      searchProducts.assignAll(products);
      return;
    }

    List<Product> result = [];

    for(int i = 0 ; i < products.length;i++){
      

      String productName = products[i].name.toLowerCase();
     
      if(productName.contains(keyword.toLowerCase())){
        result.add(products[i]);
      }

      searchProducts.assignAll(result);
    }
  }

  void editProduct(Product pro, int i){
        products[i] = pro;
        searchProducts.assignAll(products);
  }
}
