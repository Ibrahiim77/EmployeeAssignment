import 'package:flutter/material.dart';
import '../../services/EmployeeService.dart';
import '../../models/EmployeeModel.dart';
import '../../services/DepartmentService.dart';
import '../../models/DepartmentModel.dart';


class EmployeeList extends StatefulWidget{

  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList>{

  List<Employee> list = [];
  bool isLoading = true;

  load() async{
    setState(() {
      isLoading= true;
    });

    try{
      list = await Employeeservice.getEmployees();
    } catch(e){
      debugPrint("Error loading");
    }
  }

  @override
  void initState(){
    super.initState();
    load();
  }



  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: const Text("Employees"),),

      body: isLoading
           ? const Center(child:  CircularProgressIndicator())
          : list.isEmpty
        ? const Center(child: Text("No employees Found"))
          : ListView.builder( itemCount: list.length,
          itemBuilder: (context, i){
            final s = list[i];

            return Card(
              child: ListTile(
                title: Text(s.name ?? "No name"),
              ),
            );


          })
    );
  }
}