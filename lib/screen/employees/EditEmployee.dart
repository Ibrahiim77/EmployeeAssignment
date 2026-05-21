// ===============================
// EditEmployee.dart
// ===============================

import 'package:flutter/material.dart';
import '../../models/EmployeeModel.dart';
import '../../services/EmployeeService.dart';

class EditEmployee extends StatefulWidget {

  final Employee employee;

  const EditEmployee({
    super.key,
    required this.employee,
  });

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController salaryController;
  late TextEditingController departmentController;

  bool isLoading = false;

  @override
  void initState() {

    super.initState();

    nameController =
        TextEditingController(text: widget.employee.name);

    emailController =
        TextEditingController(text: widget.employee.email);

    salaryController =
        TextEditingController(text: widget.employee.salary.toString());

    departmentController =
        TextEditingController(text: widget.employee.department);
  }

  updateEmployee() async {

    setState(() {
      isLoading = true;
    });

    try {

      Employee employee = Employee(
        name: nameController.text,
        email: emailController.text,
        salary: int.parse(salaryController.text),
        department: departmentController.text,
      );

      await Employeeservice.updateEmployee(
        widget.employee.id!,
        employee,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Employee Updated Successfully"),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      debugPrint("Update Error: $e");

    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Employee"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(

          child: Column(

            children: [

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Employee Name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: salaryController,
                decoration: const InputDecoration(
                  labelText: "Salary",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: departmentController,
                decoration: const InputDecoration(
                  labelText: "Department",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(

                width: double.infinity,

                height: 50,

                child: ElevatedButton(

                  onPressed: isLoading ? null : updateEmployee,

                  child: isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text(
                    "Update Employee",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}