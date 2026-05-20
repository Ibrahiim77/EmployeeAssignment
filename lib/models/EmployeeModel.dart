import 'package:flutter/material.dart';


class Employee{

  int? id;
  String? name;
  String? email;
  int? salary;
  String? department;

  Employee({this.id , required this.name, required this.email, required this.salary, required this.department});

  factory Employee.fromJson(Map<String, dynamic> json) {
  return Employee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      salary: json['salary'],
      department: json['department']
  );
  }

  Map<String, dynamic> toJson() {
    return{
      "name" : name,
      "email" : email,
      "salary" : salary,
      "department" : department,
    };
  }



}