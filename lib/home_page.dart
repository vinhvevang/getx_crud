import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_begin/card_product.dart';
import 'package:getx_begin/getx_controller.dart';
import 'package:getx_begin/model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final getxController controller = Get.find<getxController>();
  TextEditingController textController = TextEditingController();
  TextEditingController priceControl = TextEditingController();
  TextEditingController quanityControll = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      controller.searchProduct(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      label: Text("Nhap san pham can tim... "),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      
                    ),
                  ),
                ),
                IconButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameFilter = TextEditingController();
        TextEditingController priceFilter = TextEditingController();

        return AlertDialog(
          title: Text("Lọc sản phẩm"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameFilter,
                decoration: InputDecoration(labelText: "Tên sản phẩm"),
              ),
              // TextFormField(
              //   controller: priceFilter,
              //   keyboardType: TextInputType.number,
              //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //   decoration: InputDecoration(labelText: "Giá"),
              // ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.searchProducts.assignAll(controller.products);
                // Get.back();
              },
              child: Text("Reset"),
            ),
            TextButton(
              onPressed: () {
                String name = nameFilter.text;
                // int price = int.tryParse(priceFilter.text) ?? 0;

                controller.FilterProduct(name);

              
              },
              child: Text("Lọc"),
            ),
          ],
        );
      },
    );
  },
  icon: Icon(Icons.filter_list),
)
              ],
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 3,
                  ),
                  itemCount: controller.searchProducts.length,
                  itemBuilder: (context, i) {
                    final product = controller.searchProducts[i];

                    return MyWidget(
                      name: product.name,
                      price: product.price,
                      quanity: product.quantity,
                      ondelete: () => controller.onDeleted(i),
                      onEdit: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Sua thong tin san pham"),
                              actions: [
                                TextFormField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    label: Text("ten san pham"),
                                  ),
                                ),
                                TextFormField(
                                  controller: priceControl,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    label: Text("gia"),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  controller: quanityControll,
                                  decoration: InputDecoration(
                                    label: Text("so luong"),
                                  ),
                                ),
                                TextButton(onPressed:(){
                                  Product pro = Product(name: textController.text, price: int.tryParse(priceControl.text)?? 0, quantity: int.tryParse(quanityControll.text)?? 0);
                                  
                                  
                                   controller.editProduct(pro, i);
                                   } , child: Text("Hoan tat"))
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Nhap nhiem vu"),
                  actions: [
                    TextFormField(
                      controller: textController,
                      decoration: InputDecoration(label: Text("ten san pham")),
                    ),
                    TextFormField(
                      controller: priceControl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(label: Text("gia")),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: quanityControll,
                      decoration: InputDecoration(label: Text("so luong")),
                    ),
                    TextButton(
                      onPressed: () {
                        int? price = int.tryParse(priceControl.text);
                        int? quan = int.tryParse(quanityControll.text);
                        Product res = Product(
                          name: textController.text,
                          price: price ?? 0,
                          quantity: quan ?? 0,
                        );
                        controller.addTask(res);
                      },
                      child: Text("them"),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
