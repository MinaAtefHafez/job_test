




import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_test/core/colors/colors.dart';

void showSnackBar ({
  required String title ,
   required String message
}) {
  Get.snackbar( title , message  ,
   duration: const Duration(seconds: 5 ) ,
   colorText: AppColors.white ,
   backgroundColor: AppColors.green ,
   snackPosition: SnackPosition.BOTTOM ,
   padding: const EdgeInsets.all(10)  , 
  );
}