


import 'package:get/get.dart';
import 'package:job_test/controllers/home_controller.dart';
import 'package:job_test/controllers/login_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
     Get.put<LoginController>(LoginController());
     Get.put<HomeController>(HomeController());
  }

}