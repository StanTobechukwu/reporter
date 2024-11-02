import 'package:flutter/material.dart';
import 'components/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registration.dart';
import 'selectionpage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
 
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;
  String email= '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Text('REPORT APP',
            style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        
        const  SizedBox(height: 38,),
            TextField(decoration:InputDecoration(
          border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0)
        ),
        ),
        onChanged: (value) => email= value,
        ),
         const SizedBox(height: 20.0,),
   TextField(decoration:InputDecoration(
          border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0)
        ),
        ),
        onChanged: (value) => password= value,
        ),
            const SizedBox(height: 40.0),

            // Login button
             RoundedButton(
              title: 'LOGIN',
              colour: Colors.blueAccent, 
            onPressed: ()async{
              
              try{
              await _auth.signInWithEmailAndPassword(email: email,
               password: password);
              if(mounted   )
                {
                Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SelectionPage(),),);}

               }
               catch(e){
                print('e');
               }
            },
             ),
            
             const SizedBox(height: 40.0),

            // Prompts for forgot password and sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()),);
                    // TODO: Implement forgot password functionality
                    print('Forgot Password pressed');
                  },
                  child: const Text('Forgot Password?'),
                ),
                const Text('|'),
                TextButton(
                  child:const Text('SIGN IN'),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()),);
                    // TODO: Navigate to sign up screen
                    print('Sign Up pressed');})
                    
  ])])));}}