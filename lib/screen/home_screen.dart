import 'dart:developer';

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Employee management",)),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){},
                child: const Text("Employee Module"),
            ),

            ElevatedButton(onPressed: (){},
                child:
                   const Text("Department Module"),
            ),
          ],
        ),
      ),
    );
  }


}