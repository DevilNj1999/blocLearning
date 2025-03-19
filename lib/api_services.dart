import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;


class ApiService{

  String baseUrl;
  ApiService({required this.baseUrl});

  Future<dynamic> getRequest(String endpoint) async{

    final response =  await http.get(Uri.parse(baseUrl+endpoint),headers: _headers());
    return jsonDecode(response.body);
  }

  Future<dynamic> postRequest(String endpoint,Map<dynamic,dynamic> data) async{
    final response =await http.post(Uri.parse(baseUrl+endpoint),body: jsonEncode(data),headers: _headers());
    return jsonDecode(response.body);
  }
  Future<dynamic> putRequest(String endpoint,Map<dynamic,dynamic> data) async{
    final response =await http.put(Uri.parse(baseUrl+endpoint),body: jsonEncode(data),headers: _headers());
    return jsonDecode(response.body);
  }
 Future<dynamic> deleteRequest(String endpoint) async{
    final response =await http.delete(Uri.parse(baseUrl+endpoint),headers: _headers());
    return jsonDecode(response.body);

 }


  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}