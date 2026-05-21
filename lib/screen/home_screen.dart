import 'dart:developer';

import 'package:flutter/material.dart';
import './employees/employee_list.dart';
import './departments/department_list.dart';



class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Employee management",)),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmployeeList())
              );
            },
                child: const Text("Employee Module"),
            ),

            ElevatedButton(onPressed: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DepartmentList()),
              );

            },
                child:
                   const Text("Department Module"),
            ),
          ],
        ),
      ),
    );
  }


}