import 'package:flutter/material.dart';

import '../../models/DepartmentModel.dart';
import '../../services/DepartmentService.dart';

class EditDepartment extends StatefulWidget {

  final Department department;

  const EditDepartment({
    super.key,
    required this.department,
  });

  @override
  State<EditDepartment> createState() => _EditDepartmentState();
}

class _EditDepartmentState extends State<EditDepartment> {

  late TextEditingController nameController;
  late TextEditingController locationController;

  bool isLoading = false;

  @override
  void initState() {

    super.initState();

    nameController =
        TextEditingController(text: widget.department.name);

    locationController =
        TextEditingController(text: widget.department.location);
  }

  updateDepartment() async {

    setState(() {
      isLoading = true;
    });

    try {

      Department d = Department(
        name: nameController.text,
        location: locationController.text,
      );

      await Departmentservice.updateDepartment(
        widget.department.id!,
        d,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Department Updated"),
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
        title: const Text("Edit Department"),
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

                onPressed: isLoading ? null : updateDepartment,

                child: isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text(
                  "Update Department",
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