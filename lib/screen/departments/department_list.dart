import 'package:flutter/material.dart';

import '../../models/DepartmentModel.dart';
import '../../services/DepartmentService.dart';

import 'AddDepartment.dart';
import 'EditDepartment.dart';

class DepartmentList extends StatefulWidget {

  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {

  List<Department> list = [];

  bool isLoading = true;

  loadDepartments() async {

    setState(() {
      isLoading = true;
    });

    try {

      list = await Departmentservice.getDepartments();

    } catch (e) {

      debugPrint("Load Error: $e");

    }

    setState(() {
      isLoading = false;
    });
  }

  deleteDepartment(int id) async {

    try {

      await Departmentservice.deleteDepartment(id);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Department Deleted"),
        ),
      );

      loadDepartments();

    } catch (e) {

      debugPrint("Delete Error: $e");

    }
  }

  @override
  void initState() {
    super.initState();
    loadDepartments();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Departments"),
      ),

      body: isLoading

          ? const Center(
        child: CircularProgressIndicator(),
      )

          : list.isEmpty

          ? const Center(
        child: Text("No Departments Found"),
      )

          : Padding(

        padding: const EdgeInsets.all(10),

        child: ListView.builder(

          itemCount: list.length,

          itemBuilder: (context, i) {

            final d = list[i];

            return Card(

              elevation: 4,

              margin: const EdgeInsets.only(bottom: 12),

              child: ListTile(

                leading: CircleAvatar(
                  child: Text(
                    d.name![0].toUpperCase(),
                  ),
                ),

                title: Text(
                  d.name ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  "Location: ${d.location}",
                ),

                trailing: Row(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    IconButton(

                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),

                      onPressed: () async {

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditDepartment(
                              department: d,
                            ),
                          ),
                        );

                        loadDepartments();
                      },
                    ),

                    IconButton(

                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),

                      onPressed: () {

                        showDialog(

                          context: context,

                          builder: (_) => AlertDialog(

                            title: const Text("Delete"),

                            content: const Text(
                              "Are you sure?",
                            ),

                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),

                              TextButton(

                                onPressed: () {

                                  Navigator.pop(context);

                                  deleteDepartment(d.id!);

                                },

                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),

        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddDepartment(),
            ),
          );

          loadDepartments();
        },
      ),
    );
  }
}