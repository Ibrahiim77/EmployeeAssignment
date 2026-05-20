import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/ApiService.dart';
import '../models/EmployeeModel.dart';


class Employeeservice {

  static Future<List<Employee>> getEmployees() async {
    final res = await http.get(Uri.parse(Apiservice.employees));
    final data = jsonDecode(res.body) as List;

    return data.map((e) => Employee.fromJson(e)).toList();
  }


  static Future<void>addEmployee(Employee e) async {

   final res = await http.post(Uri.parse(Apiservice.employees),
    headers: {"Content-Type" : "application/json"},
      body: jsonEncode(e.toJson())
    );
    

  }


  static Future<void> updateEmployee(int id, Employee e) async {
    final res = await http.put(Uri.parse("${Apiservice.employees}/$id"),

        headers: {"Content-Type": "application/json"},
        body: jsonEncode(e.toJson())
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to update course: ${res.body}");
    }
  }




  static Future<void> deleteEmployee(int id) async{
   final res =  await http.delete(Uri.parse("${Apiservice.employees}/$id"),
    );

    if(res.statusCode != 200){
      throw Exception("FAILED TO DELETE EMPLOYEE");
    }
  }





}