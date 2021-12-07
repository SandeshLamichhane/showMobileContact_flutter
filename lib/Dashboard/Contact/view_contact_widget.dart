import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactWidget{
  static Widget gobackwidget= Padding(
               padding: const EdgeInsets.all(12.0),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child:   IconButton(
                   splashColor: Colors.red,
                   icon:Icon(Icons.arrow_back),
                   onPressed: (){

                   }
                   
                   ,)));
}