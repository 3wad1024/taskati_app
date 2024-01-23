

import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
showErrorwidget(context,text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.redcolor,
                      duration:const Duration(seconds: 2),
                      content: Text(text)));
}

pushWithReplacment(context,newview){
Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => newview,
        ));
}


push(context,newview){
Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => newview,
        ));
}