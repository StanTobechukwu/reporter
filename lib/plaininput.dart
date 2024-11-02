import 'package:flutter/material.dart';


class PlainInputPage extends StatelessWidget {
  final TextEditingController controller;
  const PlainInputPage({super.key, required this.controller});

  @override
 
  Widget build(BuildContext context) {
     return Padding(
        padding: const EdgeInsets.all(8.0), // Padding for the entire body
        child:
        SingleChildScrollView(
          child:  Column(
          children: [
            Padding(
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
           keyboardType: TextInputType.multiline),),
        
        
            ]),
            )
      );}}