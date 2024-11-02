import 'package:flutter/material.dart';
//import 'secondScreen.dart';
//import 'selectionpage.dart';

// InputPage widget with controllers passed to SelectionPage
class InputPage extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  final TextEditingController controller5;

  const InputPage({super.key, 
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
    required this.controller5,
  });


final TextStyle ktextstyleForHeader = const TextStyle(fontWeight: FontWeight.bold,
 fontSize: 26,);
    kTextField({required TextEditingController controller, }){ return Padding(
     padding: const EdgeInsets.all(8.0),
     child: TextField(
      maxLines:2,
      controller: controller,
      style:const TextStyle(fontSize: 18),
      decoration:InputDecoration(
         filled:true,
         fillColor: Colors.grey[200] ,
         border:OutlineInputBorder(borderSide:const BorderSide(style:BorderStyle.solid),
         borderRadius: BorderRadius.circular(0))),
         keyboardType: TextInputType.multiline),
   );}

 

 

  @override
  Widget build(BuildContext context) {
    
    return //Scaffold(appBar:AppBar(title:const Text('Endoscopy Report',style:TextStyle(fontWeight: FontWeight.bold,
 //fontSize: 26,),
 //),
 //),
 
    //body: 
    Padding(
        padding: const EdgeInsets.all(8.0), // Padding for the entire body
        child:
        SingleChildScrollView(
          child: Column(children:
    [const Text('mouth and pharynx'), 
    kTextField(controller:controller1), 
    const SizedBox(height:20),
    const Text('upper third of esophagus'),
    kTextField(controller: controller2), const SizedBox(height:20),
    const Text('midlle third of esophagus'),
    kTextField(controller: controller3), const SizedBox(height:20),
    const Text('lower third of esophagus'),
    kTextField(controller: controller4), const SizedBox(height:20),
     const Text('stomach and duodenum'),
    kTextField(controller: controller5), const SizedBox(height:20),
 
    

ElevatedButton(
  onPressed: () {
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
  },
  child: const Text('Clear Fields'),
)

],
),
));}
}