
import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {

  void upload(File fileUpload){
    final FirebaseStorage storage = FirebaseStorage.instance;
    try {
      Reference ref = storage.ref().child('images/myImage.jpg');
      UploadTask uploadTask = ref.putFile(fileUpload);

      uploadTask.then((TaskSnapshot snapshot) {
        print('File uploaded successfully');
      }).catchError((error) {
        print('File uploaded error : $error');
      });
    } catch (e) {
      print("File uploaded error : $e");
    }
  }

  void download(String fileName){
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(fileName);
      ref.getDownloadURL().then((String url) {
        print('File download successfully $url');
      }).catchError((error) {
        print('File download error : $error');
      });
    } catch (e) {
      print("File uploaded error : $e");
    }
  }

  void delete(){
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/myImage.jpg');
      ref.delete().then(() {
        print('File deleted successfully');
      } as FutureOr Function(void value)).catchError((error) {
        print('File deleted error : $error');
      });
    } catch (e) {
      print("File deleted error : $e");
    }
  }

}