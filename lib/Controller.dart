import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmg/Api.dart';

import 'HttpService.dart';

class Controller extends GetxController{
  getUserData() async {
    var response=await httpGet(Api.users);
    return response;
  }
  getAllPostData() async {
    var response=await httpGet(Api.posts);
    return response;
  }

  getSinglePostData(id) async {
    var response=await httpGet(Api.posts+"/$id");
    return response;
  }
}