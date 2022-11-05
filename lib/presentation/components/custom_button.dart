







// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_test/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
 
  Function () onTap ;
  CustomButton ({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
          height: 45 ,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue ,
            borderRadius: BorderRadius.circular(15) ,
          ),
          child: Text('SUBMIT' , style: TextStyle( color: AppColors.white , fontSize: 17 , fontWeight: FontWeight.w600  ), ),
      ),
    );
  }
}