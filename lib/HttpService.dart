import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Api.dart';
httpGet(url) async {
  print("${Api.baseURL}$url");
  var response=await http.get(Uri.parse("${Api.baseURL}$url"));
  if(response.statusCode==200){
    try{
      return jsonDecode(response.body);
    }catch(e){}

  }else{
    Fluttertoast.showToast(msg: "Something went wrong");
  }
}