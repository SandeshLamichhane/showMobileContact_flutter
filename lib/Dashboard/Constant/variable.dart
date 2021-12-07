import 'package:flutter/material.dart';

class VariableConstant {

 static  InputDecoration textfieldDecoration= InputDecoration(
         labelText:"कृपया ग्राहकको नाम जोड्नुहोस्",
         
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(width: 1.5, color:  Colors.grey)
          ) , 
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(width: 1.5, color:  Colors.grey)
          ) ,
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(width: 1.5, color:  Colors.purple)
          )   
        );


}