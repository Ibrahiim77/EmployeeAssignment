import 'package:flutter/material.dart';
import '../../services/EmployeeService.dart';
import '../../models/EmployeeModel.dart';


class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  List<Employee> list = [];
  bool isLoading = true;

  // LOAD EMPLOYEES
  load() async {

    setState(() {
      isLoading = true;
    });

    try {

      list = await Employeeservice.getEmployees();

    } catch (e) {

      debugPrint("Error loading employees: $e");

    }

    setState(() {
      isLoading = false;
    });
  }

  // DELETE EMPLOYEE
  deleteEmployee(int id) async {

    try {

      await Employeeservice.deleteEmployee(id);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Employee Deleted"),
        ),
      );

      load();

    } catch (e) {

      debugPrint("Delete Error: $e");

    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Employees"),
        centerTitle: true,
      ),

      body: isLoading

          ? const Center(
        child: CircularProgressIndicator(),
      )

          : list.isEmpty

          ? const Center(
        child: Text(
          "No Employees Found",
          style: TextStyle(fontSize: 18),
        ),
      )

          : Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(

          itemCount: list.length,

          itemBuilder: (context, i) {

            final s = list[i];

            return Card(

              elevation: 4,
              margin: const EdgeInsets.only(bottom: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: ListTile(

                contentPadding: const EdgeInsets.all(12),

                leading: CircleAvatar(
                  child: Text(
                    s.name![0].toUpperCase(),
                  ),
                ),

                title: Text(
                  s.name ?? "No Name",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 5),

                    Text("Email: ${s.email}"),

                    Text("Salary: ${s.salary}"),

                    Text("Department: ${s.department}"),
                  ],
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // EDIT
                    IconButton(

                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),

                      onPressed: () async {

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditEmployee(
                              employee: s,
                            ),
                          ),
                        );

                        load();
                      },
                    ),

                    // DELETE
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
                              "Are you sure you want to delete?",
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

                                  deleteEmployee(s.id!);

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

      // ADD BUTTON
      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),

        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddEmployee(),
            ),
          );

          load();
        },
      ),
    );
  }
}