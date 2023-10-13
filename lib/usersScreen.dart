import 'package:flutter/material.dart';

import 'Controller.dart';
import 'package:get/get.dart';

import 'model/UsersModel.dart';
class UsersSceen extends StatefulWidget {
  const UsersSceen({super.key});

  @override
  State<UsersSceen> createState() => _UsersSceenState();
}

class _UsersSceenState extends State<UsersSceen> {
  Controller controller=Get.put(Controller());
  List<UsersModel>? list;
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var responseUser=await controller.getUserData();
    list = List<UsersModel>.from(responseUser.map((item)=> UsersModel.fromJson(item)).toList());
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: list==null?Center(child: CircularProgressIndicator()):
            ListView.builder(itemCount: list!.length,itemBuilder: (itemBuilder,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(10)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text("Name: ${list![index].name!}"),
                    Text("UserName: ${list![index].username!}"),
                    Text("Email: ${list![index].email!}"),
                    Text("Phone: ${list![index].phone!}"),
                    Text("Website: ${list![index].website!}"),
                    Text("Name: ${list![index].company!.name!}"),
                    Row(
                      children: [
                        Text("Street: ${list![index].address!.street!}"),
                        Text("Suite: ${list![index].address!.suite!}"),

                      ],
                    ),
                    Row(
                      children: [
                        Text("City: ${list![index].address!.city!}"),
                        Text("ZipCode: ${list![index].address!.zipcode!}"),
                      ],
                    ),
                  ],),
                ),
              );
            })
      ),
    );
  }
}
