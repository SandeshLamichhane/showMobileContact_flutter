import 'package:flutter/material.dart';
import 'package:recipes/Dashboard/Contact/view_contact.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme= ThemeData();
    return MaterialApp(
      title:  'Recipe Calculator',
      //setting custom theme
      theme:  theme.copyWith(
             colorScheme:theme.colorScheme.copyWith(
               primary:Colors.purple,
               secondary: Colors.indigo
             )
 
         
      ),

      home: const  ViewContact(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
//https://drive.google.com/file/d/1GM0o6H4TePB3xFLDjI4RhKGxC-rEsM-4/view?usp=sharing
//https://drive.google.com/file/d/1qduLhvbe2L3aJD6ffM07snTPht5cA3Pl/view?usp=sharing
//https://drive.google.com/file/d/1vyF4aQrirOipd4_DMAshBuguSnwTBha4/view?usp=sharing


//https://drive.google.com/uc?export=view&id=1vyF4aQrirOipd4_DMAshBuguSnwTBha4
//https://drive.google.com/uc?export=view&id=1qduLhvbe2L3aJD6ffM07snTPht5cA3Pl

//https://drive.google.com/uc?export=view&id=1GM0o6H4TePB3xFLDjI4RhKGxC-rEsM-4
   @override
  Widget build(BuildContext context) {
    
    return  const ViewContact();
  }
}
