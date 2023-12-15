
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {

  final String path = "user";

 Future<List<String>> readData(String path) async {
    // try {
    //   DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(path);
    //   DataSnapshot dataSnapshot = await databaseReference.child("user").once() as DataSnapshot;
    //   if (dataSnapshot.value != null) {
    //     Map<dynamic, dynamic> data = Map<dynamic, dynamic>.from(dataSnapshot.value as Map<dynamic,dynamic>);
    //     if(data.isEmpty){
    //       return [];
    //     }
    //     return ["1","2"];
    //   } else {
    //     return [];
    //   }
    // } catch (e) {
    //   print('Error reading data: $e');
    //   return [];
    //   //throw('Error reading data: $e');
    // }
   return [];
  }

  void createData(String path, Map<String, dynamic> data) {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(path);
      databaseReference.push().set(data);
      print('Data created successfully');
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  void updateData(String path, Map<String, dynamic> newData) {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(path);
      databaseReference.update(newData);
      print('Data updated successfully');
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  void deleteData(String path) {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(path);
      databaseReference.remove();
      print('Data deleted successfully');
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}