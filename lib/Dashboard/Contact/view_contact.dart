import 'package:flutter/material.dart';
import 'package:recipes/Dashboard/Services/contact_services.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({ Key? key }) : super(key: key);

  @override
  _ViewContactState createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  final contactobj= ContactServices();

  // in the init state load the 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactobj.loadConact((){
      setState(() {  });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text("List of contact"),
        ),
        body: ListView.builder(
          itemCount: ContactServices.contacts?.length !=null ? ContactServices.contacts!.length:0 ,
           itemBuilder: (  context,   index){
          return   ListTile(
            leading: CircleAvatar(
              backgroundColor:contactobj.getColor(index) ,
              child: Text(contactobj.highlightName(ContactServices.contacts![index].displayName!),
            )),
            title: Text(ContactServices.contacts![index].displayName.toString()),
            subtitle:   Text(contactobj.getAllphone(ContactServices.contacts![index].phones),

            )
          );
        }),
      ),);
  }
}