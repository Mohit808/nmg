import 'package:flutter/material.dart';

import 'Controller.dart';
import 'package:get/get.dart';

import 'model/PostModel.dart';
import 'model/UsersModel.dart';

class SinglePostPage extends StatefulWidget {
  dynamic id;
  SinglePostPage({super.key,required this.id});

  @override
  State<SinglePostPage> createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  Controller controller=Get.put(Controller());
  PostModel? postModel;

  @override
  void initState() {
    getData();
    super.initState();
  }
  getData() async {
    var response=await controller.getSinglePostData(widget.id);
    if(response!=null){
      postModel=PostModel.fromJson(response);
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Single Post"),),
      body:postModel==null?Center(child: CircularProgressIndicator()):  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

          Text("${postModel!.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Text("${postModel!.body}"),


        ],),
      ),
    );
  }


}
