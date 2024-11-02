import 'package:flutter/material.dart';
//import 'secondScreen.dart';
import 'components/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'selectionpage.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children:[
        TextField(decoration:InputDecoration(
          border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0)
        ),
        ),
        onChanged: (value) => email= value,
        ),
        const SizedBox(height: 38.0,),
 TextField(decoration:InputDecoration(
          border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0),
        ),
        ),
        onChanged: (value) => password= value,
        ),
          const SizedBox(height: 20.0),

      
            
     RoundedButton(
      title:'Register',
       colour:Colors.blueAccent,
        onPressed: () async{
          try {
            
          final newuser = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
          {
            Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SelectionPage()),);
          }
         // else
          // print('reCAPTCHA verification failed');
                  }
                on FirebaseException catch (e) {
  if (e.code == 'network-request-failed') {
    print('Network error occurred');
  } else {
    print('Error: $e');
  }}
                }),
                RoundedButton(title:'back',colour:Colors.blueAccent, onPressed:(){Navigator.pop(context);},),
                ]
                )
                )
                ); }}
              
            
          
      