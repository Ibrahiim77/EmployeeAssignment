import 'package:flutter/material.dart';

import '../../models/DepartmentModel.dart';
import '../../services/DepartmentService.dart';

class AddDepartment extends StatefulWidget {

  const AddDepartment({super.key});

  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {

  final nameController = TextEditingController();
  final locationController = TextEditingController();

  bool isLoading = false;

  addDepartment() async {

    setState(() {
      isLoading = true;
    });

    try {

      Department d = Department(
        name: nameController.text,
        location: locationController.text,
      );

      await Departmentservice.addDepartment(d);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Department Added"),
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
        title: const Text("Add Department"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Department Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(

              controller: locationController,

              decoration: const InputDecoration(
                labelText: "Location",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,
              height: 50,

              child: ElevatedButton(

                onPressed: isLoading ? null : addDepartment,

                child: isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text(
                  "Add Department",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}