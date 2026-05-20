import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/DepartmentModel.dart';
import '../config/ApiService.dart';


class Departmentservice {

  static Future<List<Department>> getDepartments() async{
    
    final res = await http.get(Uri.parse(Apiservice.department));
    final data = jsonDecode(res.body) as List;
    
    return data.map((d) => Department.fromJson(d)).toList();
  }
  
  static Future<void> addDepartment(Department d ) async {
    final res = await http.post(Uri.parse(Apiservice.department),
    headers: {"Content-Type" : "application/json"},
      body: jsonEncode(d.toJson())
    );
  }

  static Future<void> updateDepartment(int id, Department d) async {
  
    final res = await http.put(Uri.parse("${Apiservice.department}/$id"),
    headers: {"Content-Type" : "application/json"},
      body: jsonEncode(d.toJson())
    );
  }
  
  static Future<void> deleteDepartment(int id) async{
    
    final res = await http.delete(Uri.parse("${Apiservice.department}/$id"),);

    if(res.statusCode != 200){
      throw Exception("FAILED TO DELETE");
    }
  }
  
  
  

}