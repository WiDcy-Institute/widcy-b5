import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:widcy/model/product.dart';

class FirebaseFirestoreService {

  String collectionName = "product";

  Future<List<Product>> readDocuments(String collectionName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();
      List<DocumentSnapshot> documents = querySnapshot.docs;
      for (var document in documents) {
        print('Document ID: ${document.id}');
        print('Data: ${document.data()}');
        print('Data: ${document["currency"]}');
      }
      List<Product> products = documents.map((document) => Product(document.id, document["name"], "${document["price"]}", "")).toList();
      return products;
    } catch (e) {
      print('Error reading documents: $e');
      throw("Error loading data : $e");
    }
  }

  Future<void> createDocument(String collectionName, Map<String, dynamic> data) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).add(data);
      print('Document created successfully');
    } catch (e) {
      print('Error creating document: $e');
    }
  }

  Future<void> updateDocument(String collectionName, String documentId, Map<String, dynamic> data) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).doc(documentId).update(data);
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  Future<void> deleteDocument(String collectionName, String documentId) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).doc(documentId).delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

}