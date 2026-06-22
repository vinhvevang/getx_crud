import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:getx_begin/getx_controller.dart';

class MyWidget extends StatelessWidget {
 final String name;
 final int price;
 final int quanity;
  final VoidCallback ondelete;
   MyWidget({super.key,required this.name,required this.ondelete, required this.price, required this.quanity});

  
  @override
  Widget build(BuildContext context) {
     
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      height: 100,
      width: 100,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(name),
          Text("${price}"),
          Text("$quanity"),
          IconButton(onPressed: ondelete, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}