





// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_test/core/colors/colors.dart';

class CustomFormField extends StatelessWidget {
  
  TextEditingController textEditingController ;
  final String hint ;
  final Function  validator;  
   CustomFormField({
    required this.textEditingController ,
    required this.hint, 
    required this.validator
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController ,
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.only( left: 30 , right: 20 ),
        hintText: hint ,
        hintStyle: TextStyle(
            fontSize: 15 ,
            color:  Colors.grey.shade500 ,
            fontWeight: FontWeight.w500 
        ),
        fillColor: AppColors.white ,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none ,
        ) ,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none ,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none ,
        ), 
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none ,
        ) , 
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
         borderSide: BorderSide.none ,
        ) ,
      ),
      validator: (value)=> validator(value)
    );
  }
}