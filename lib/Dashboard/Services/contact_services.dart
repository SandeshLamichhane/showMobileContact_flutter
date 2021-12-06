import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
import 'package:permission_handler/permission_handler.dart';

class ContactServices{
 static List<Contact>? contacts;
  //load the contact from phone
  loadConact(VoidCallback aftersuccess)async{
    try{
  
   if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
    contacts = await ContactsService.getContacts();  
    aftersuccess();
   }
     }
    catch(e){
      print(e.toString());
    }
  }
  //this function will mainly show name in two word
  String highlightName(String displayName){
   String higlightString="";
   if(displayName.contains(" ")){
   higlightString=displayName.split(' ')[0].substring(0,1)+displayName.split(' ')[1].substring(0,1);
   }else{
     higlightString= displayName.substring(0,1).toUpperCase();
   }
   return higlightString;
  }

  getColor(int index) {
    if(index%2==0){
      return Colors.indigo;
    }else{
      Colors.teal;
    }
  }

  String getAllphone(List<Item>? phones) {

 String phoneNumberList="";
 
   phoneNumberList=phones!.map((e) => e.value as String).toList(). join(', ').toString();
 
 return phoneNumberList;
  }
 
}