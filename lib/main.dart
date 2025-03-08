import 'package:flutter/material.dart';
import 'crud_op.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
  try{
  await Hive.initFlutter();
  await Hive.openBox("crud");
  runApp( CrudOp());
  }
  catch(e){
    print("erro ");
  }
}
 