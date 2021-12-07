import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:recipes/Dashboard/Constant/variable.dart';
import 'package:recipes/Dashboard/Contact/view_contact_widget.dart';
import 'package:recipes/Dashboard/Services/contact_services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({ Key? key }) : super(key: key);
  static bool  showphoneinput=true;
  static String inputName="";

  @override
  _ViewContactState createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  final contactobj= ContactServices();
  String initialCountry = 'NP';
  PhoneNumber number = PhoneNumber(isoCode: 'NP');
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
      child: GestureDetector(
        onTap:(){
         FocusScope.of(context).unfocus();
           if(ContactServices.contacts!=null && ViewContact.inputName.trim()==""){
            
        
            ContactServices.contacts=ContactServices.tempContacts!.map((e)=> e).toList();
            setState((){});
          }
        },
        child: Scaffold(
         
          body: Column(
            children: [
              ContactWidget.gobackwidget,
                searchContact(),

              !  ViewContact.showphoneinput?
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: createphoneIput()
                  )
              ):
              Container(),
             const  SizedBox(height: 5,),
              Flexible(
                child: Container(
                                  color: Theme.of(context).primaryColor.withOpacity(0.1),

                  child: ListView.builder(
                    shrinkWrap:true,
                    itemCount: ContactServices.contacts?.length !=null ? ContactServices.contacts!.length+1:1 ,
                     itemBuilder: (  context,   index){
                      // if index is 1o then add new customer
                    if(index==0){
                    return  
                    ViewContact.showphoneinput?
                      addNewWidget(): Container();
                    }else{
                    return   
                     displyaContact(ContactServices.contacts![index-1], index-1);
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),);
  }

  Widget displyaContact(Contact contact, int index) {
    return ListTile(
            leading: CircleAvatar(
              backgroundColor:contactobj.getColor(index) ,
              child: Text(contactobj.highlightName(ContactServices.contacts![index].displayName!),
            )),
            title: Text(ContactServices.contacts![index].displayName.toString()),
            subtitle:   Text(contactobj.getAllphone(ContactServices.contacts![index].phones),

            )
          );
  }

  Widget addNewWidget() {

 
    return   ListTile(
      onTap: (){
        ////
        ViewContact.showphoneinput= !ViewContact.showphoneinput;
        setState((){});
      },
      leading:const CircleAvatar(child: Icon(Icons.add),backgroundColor:Colors.blueGrey),
      title: const Text("Add new Customer"),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  searchContact() {
    return Padding(
      padding: const EdgeInsets.only(left:12.0, right:12.0),
      child: TextFormField(
        
         textInputAction:TextInputAction.next,
        onChanged:(String inputName){
    
        ViewContact.inputName=inputName;
         // filter the list
         if(ContactServices.contacts!=null){
            
         ContactServices.contacts= ContactServices.contacts!.where((x) =>
          x.displayName!.toLowerCase().contains(inputName)).toList();
          setState((){});
         
          }else{
            ContactServices.contacts=ContactServices.tempContacts!.map((e)=> e).toList();
            setState((){});
          }


        },
        decoration:  VariableConstant.textfieldDecoration.copyWith(
          labelText: "नाम जोड्नुहोस",
          suffixIcon: ViewContact.showphoneinput?  const Icon(Icons.search):null
        )
      ),
    );
     
  }

  createphoneIput() {

    return Column(
                      children: <Widget>[
                     InternationalPhoneNumberInput(
                       maxLength: 10,
                       hintText:'फोन नम्बर प्रविष्ट गर्नुहोस' ,
                      onInputChanged: (PhoneNumber number) {
                      //  PhoneNumberController.phoneNumber=number.toString();
                       // phoneNumber= int.parse(number.toString());
                       },
                      onInputValidated: (bool value) {
                       
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                     // textFieldController: controller,
                      formatInput: false,
                      keyboardType:
                         const  TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                       
                      },
                    ),
                   const SizedBox(height: 20,),
                        
                      ViewContact.inputName.trim()==""? Container():
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child:SizedBox(
                            height:50,
                            width: double.maxFinite,
                            child: ElevatedButton(onPressed: (){},
                             child:   Text("नाम जोड्नुहोस",
                             style: TextStyle(
                               fontFamily: "Verdana",
                               fontSize:   MediaQuery.of(context).size.height/45
                             ),
                             
                             ),
                             
                             ))
                        )
                      ],
                    );
  }
}