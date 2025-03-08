import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrudOp extends StatelessWidget {
  CrudOp({super.key});

  // Initialize Hive box for CRUD operations
  final _crud = Hive.box("crud");

  // Method to write data
  void _writeData() {
    _crud.put("name", "Abraham");
  }

  // Method to delete data
  void _deleteData() {
    _crud.delete("name");
  }

  // Method to update data
  void _updateData() {
    _crud.put("name", "Tom");
  }

  // Method to read data
  void _readData() {
    print(_crud.get("name"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CRUD Operation"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0), // Add padding for better UI
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: _writeData,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text("Write Data"),
                  ),
                  MaterialButton(
                    onPressed: _readData,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text("Read Data"),
                  ),
                  MaterialButton(
                    onPressed: _updateData,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text("Update Data"),
                  ),
                  MaterialButton(
                    onPressed: _deleteData,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text("Delete Data"),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add spacing
              // Display the data from Hive
              ValueListenableBuilder(
                valueListenable: _crud.listenable(),
                builder: (context, box, widget) {
                  return Text(
                    "Name: ${_crud.get("name") ?? "No data"}",
                    style: const TextStyle(fontSize: 18),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}