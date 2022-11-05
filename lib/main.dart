// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_test/core/bindings/bindings.dart';
import 'package:job_test/core/constants/constants.dart';
import 'package:job_test/core/helpers/dio_helper.dart';
import 'package:job_test/presentation/screens/home_screen.dart';
import 'package:job_test/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  
  await GetStorage.init();
  DioHelper.init();
  AppConstants.token = GetStorage().read('token') ?? '' ;

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       initialBinding: Binding(),
       debugShowCheckedModeBanner: false ,
       home: AppConstants.token != '' ? HomeScreen(name: GetStorage().read('name') , token: GetStorage().read('token') ) : LoginScreen() ,
    );
  }
}



