import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
class CrudOp extends StatelessWidget {
  CrudOp({super.key});
  
   final _crud=Hive.box("crud");

   void _writeData(){
    _crud.put("name2","Abraham");
   }
   void _deleteData(){
    _crud.delete("name");
   }
   void _UpdateData(){
      _crud.put("name", "tom");
   }
   void _readData(){
     print( _crud.get("name"));
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("CRUD Operation")),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed:_writeData,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Write data"),
              ),
              MaterialButton(
                onPressed:_readData,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Read Data"),
              ),
              MaterialButton(
                onPressed: _UpdateData,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Update Data"),
              ),
                MaterialButton(
                onPressed: _deleteData,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Delete Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
