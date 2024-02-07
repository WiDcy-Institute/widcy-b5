
import 'package:widcy/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductService {

  Future<List<Product>> fetchData() async {
    var url = Uri.http('localhost', '/shopapi/products_api.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonRes = convert.jsonDecode(response.body);
      print('Number of books about http: $jsonRes.');
      List<Product> products = jsonRes.map((json) => Product.fromJson(json)).toList();
      print('Number of books about http: $products.');
      return products;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw("Error");
    }
  }

  Future<void> saveData(String name) async {
    var url = Uri.http('localhost', '/shopapi/products_api.php');
    var bodyReq = {
      "name":name
    };
    var response = await http.post(url, body: bodyReq);
    if (response.statusCode == 200) {

    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw("Error");
    }
  }

  Future<void> updateData(int id , String name) async {
    var url = Uri.http('localhost', '/shopapi/products_api.php/$id');
    var bodyReq = {
      "name":name
    };
    var response = await http.put(url, body: bodyReq);
    if (response.statusCode == 200) {

    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw("Error");
    }
  }

}