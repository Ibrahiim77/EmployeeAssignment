
import 'package:flutter/material.dart';
import '../../models/EmployeeModel.dart';
import '../../services/EmployeeService.dart';

class AddEmployee extends StatefulWidget {

  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final salaryController = TextEditingController();
  final departmentController = TextEditingController();

  bool isLoading = false;

  addEmployee() async {

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

      await Employeeservice.addEmployee(employee);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Employee Added Successfully"),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      debugPrint("Add Error: $e");

    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Employee"),
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

                  onPressed: isLoading ? null : addEmployee,

                  child: isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text(
                    "Add Employee",
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