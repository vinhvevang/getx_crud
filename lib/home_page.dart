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

  final controller = Get.find<getxController>();
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
            TextFormField(
              onChanged: (value) {
                controller.searchProduct(value);
              },
              decoration: InputDecoration(
                label: Text("Nhap san pham can tim... "),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                icon: Icon(Icons.search),
              ),
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
                        int ? quan = int.tryParse(quanityControll.text);
                        Product res = Product(
                          name: textController.text,
                          price: price ?? 0,
                          quantity: quan??0,
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
