
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:widcy/model/faculty.dart';

class FirebaseDatabaseService {

  final String path = "user";

 Future<List<Faculty>> readData(String path) async {
   List<Faculty> faculties = [];
   try {
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(path);

      // databaseReference.once().then((DataSnapshot snapshot) {
      //   print("read once ${snapshot.value}");
      //
      // } as FutureOr Function(DatabaseEvent value)).catchError((error) {
      //   print('Firebase Database error: $error');
      //   throw("Error $error");
      // });
      databaseReference.onValue.listen((DatabaseEvent event) {
        DataSnapshot snapshot = event.snapshot;
        print("read once ${snapshot.value}");
      } as void Function(DatabaseEvent event)?, onError: (error) {
        // Handle any errors that occur during the read operation
        print('Firebase Database error: $error');
        throw("Error $error");
      });


     // DatabaseReference childReference = databaseReference.child(path);
      // databaseReference.onValue.listen((DatabaseEvent event) {
      //   DataSnapshot snapshot = event.snapshot;
      //   var data = snapshot.value;
      //   print("read once ${snapshot.value}");
      // }, onError: (error){
      //   throw("Error $error");
      // });


      // if (dataSnapshot.value != null) {
      //   // Map<dynamic, dynamic> data = Map<dynamic, dynamic>.from(dataSnapshot.value as Map<dynamic,dynamic>);
      //   //List<Faculty> faculties = dataSnapshot.value.map((dataSnapshot) => Faculty(data.keys, name)).toList();
      //   Map<String, dynamic> data = dataSnapshot. as Map<String, dynamic>;
      //   print(dataSnapshot.value);
      //   return [];
      // } else {
      //   throw('Data not found');
      // }
    } catch (e) {
      print('Error reading data: $e');
      throw('Error reading data: $e');
    }
    return faculties;
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