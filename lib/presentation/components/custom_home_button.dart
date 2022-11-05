





// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_test/core/colors/colors.dart';

class CustomHomeButton extends StatelessWidget {

  IconData icon ;
  Color iconColor ;
  String text ;
  Function () onTap ;
  CustomHomeButton({required this.icon , required this.iconColor , required this.text , required this.onTap });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        padding: const EdgeInsets.symmetric( vertical: 10 , horizontal: 20   ),
        decoration: BoxDecoration(
          color: AppColors.white ,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
             Icon( icon , color: iconColor, size: 25 , ),
             const SizedBox(width: 12 ,), 
             Text(text , style: const TextStyle( color: Colors.black  , fontSize: 20  ), )
           ],
        ),
      ),
    );
  }
}