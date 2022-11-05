
// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_test/controllers/login_controller.dart';
import 'package:job_test/core/colors/colors.dart';
import 'package:job_test/core/constants/enums.dart';
import 'package:job_test/presentation/components/custom_button.dart';
import 'package:job_test/presentation/components/custom_form_field.dart';


class LoginScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginController) {
      return Scaffold(
         
      body: Stack(
        alignment: Alignment.center,
        children :[
           Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
              AppColors.pinkLogin ,
              AppColors.grayLogin ,
              AppColors.purpleLogin
            ],
            begin: Alignment.topLeft ,
            end: Alignment.centerRight 
            ),
          ),
        ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox( height: Get.height *0.13 , ),
                  Text('My' , style: TextStyle( color: Colors.black.withOpacity(0.7) , fontSize: 48 , fontWeight: FontWeight.bold ), ),
                  Text('Gallery' , style: TextStyle( color: Colors.black.withOpacity(0.7) , fontSize: 48 , fontWeight: FontWeight.bold  ), ),
                  const SizedBox(height: 40 ),
                  squareLogin(loginController: loginController),
                  
                ],
            ),
          ),
        ], 
      ),
    );
    } );
  }



   Widget squareLogin ({
    required LoginController loginController
   }) {
   return BlurryContainer (
        blur: 6 ,
        color: AppColors.grayLogin ,
        elevation: 0.0 ,
        height: Get.height * 0.4 ,
        width: Get.width *0.7 ,
        padding: const EdgeInsets.symmetric( vertical: 35 , horizontal:  20 ),
        child: LayoutBuilder(builder: (_ ,size) {
         
          return Form(
            key: formKey,
            child: Column(
            children: [ 
              Text('LOG IN' , style : TextStyle( color: Colors.black.withOpacity(0.7) , fontSize: 30 , fontWeight: FontWeight.bold ) ),
                 SizedBox(height: size.maxHeight * 0.07 ,) ,
              Expanded(
                child: CustomFormField(textEditingController: emailController , hint: 'Email', validator: (value){
                   if ( value!.isEmpty ) {
                  return 'please , enter your email !';
                }
                return null ;
                }),
              ),
               SizedBox(height: size.maxHeight * 0.07 ,) ,
              Expanded(
                child: CustomFormField(textEditingController: passController , hint: 'Password', validator: (value){
                  if ( value!.isEmpty ) {
                    return 'please , enter your password !';
                  }
                  return null ;
                } ),
              ),
               SizedBox( height : size.maxHeight * 0.07 ,),
              Builder(builder: (_) {
                      if ( loginController.loginState == LoadState.loading ) {
                         return const Center(child: CircularProgressIndicator());
                      } else {
                        return  CustomButton(onTap: (){
                          if ( formKey.currentState!.validate() ) {
                            loginController.login(email: emailController.text.trim() , password: passController.text.trim() );
                          }
                        } );
                      }
              } ),
             ],
                  ),
          ) ;
        } ),
      );
   }

}