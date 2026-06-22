import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_begin/getx_controller.dart';
import 'package:getx_begin/home_page.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController tax = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  final controller = Get.find<getxController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              TextFormField(controller: tax,
              keyboardType: TextInputType.number,
              inputFormatters: [ 
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                label: Text("ma so thue")
              ),),
              if (controller.taxError.value != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.taxError.value.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              SizedBox(height: 30),
              TextFormField(controller: userName,
              decoration: InputDecoration(
                label: Text("tai khoan")
              ),),
              if (controller.nameError.value != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.nameError.value.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              SizedBox(height: 30),
              TextFormField(controller: passWord,
              decoration: InputDecoration(
                
                label: Text("mat khau")
              ),
              ),
              if (controller.passWordError.value != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.passWordError.value.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: () {
                    final taxNum = int.tryParse(tax.text);
                  if (taxNum != 11111) {
                    controller.taxError.value = "Can du 5 ki tu";
                  }
                  if (userName.text.isEmpty) {
                    controller.nameError.value = "khong duoc de trong";
                  }
                  if (passWord.text.length < 6 ||
                      passWord.text.length > 50 ||
                      passWord.text.isEmpty) {
                    controller.passWordError.value = " 6< password <50 ";
                  }

                 else if (taxNum == 11111 &&
                      userName.text == "demo" &&
                      passWord.text == "123456") {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Dang nhap thanh cong"),
                          actions: [
                            IconButton(
                              onPressed:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomePage(),
                                    ),
                                  ),
                              icon: Icon(Icons.arrow_right),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else {
                       showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Dang nhap that bai"),
                          actions: [
                            IconButton(
                              onPressed:
                                  () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text("dang nhap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
