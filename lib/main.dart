import 'package:flutter/material.dart';
import 'package:report_app/registration.dart';
import 'package:report_app/wellcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ReportApp());
}


class ReportApp extends StatelessWidget {

   const ReportApp({super.key});


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute:'welcome_screen',
    routes:{
      'welcome_screen':(context) =>const WelcomeScreen(),
      'registration_screen':(context) =>const RegistrationScreen(),
        }
      ); 
      } 
    }
   