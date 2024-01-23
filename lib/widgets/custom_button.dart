import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,required this.onTap,this.width=100,this.style});
  final String text;
  final Function()? onTap; 
  final double width;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
            onTap: onTap,
             child: Container(
              width: width,
              height: 50,
              alignment: Alignment.center,
              decoration:BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(15),
                
             
              ),
              child: Text(
                '$text',
              style:style == null? getBodyStyle(color: AppColors.whitecolor):style,
              ),
                       ),
           );
  }
}