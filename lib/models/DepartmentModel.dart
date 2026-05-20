import 'package:flutter/material.dart';


class Department{

  int? id;
  String? name;
  String? location;


  Department({this.id, required this.name, required this.location});

  factory Department.fromJson(Map<String, dynamic> json){
    return Department(
        id: json['id'],
        name: json['name'],
        location: json['location']
    );

  }

  Map<String, dynamic> toJson() {
    return{
      "name" : name,
      "location" : location
    };
  }


}