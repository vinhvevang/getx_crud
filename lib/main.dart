import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_begin/getx_controller.dart';
import 'package:getx_begin/home_page.dart';
import 'package:getx_begin/login.dart';

void main(){
  Get.put(getxController());
  runApp(MaterialApp(home: Login()));
}