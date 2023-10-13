import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg/Controller.dart';
import 'package:nmg/SinglePostPage.dart';
import 'package:nmg/model/PostModel.dart';
import 'package:nmg/model/UsersModel.dart';

class Postpage extends StatefulWidget {
  const Postpage({super.key});

  @override
  State<Postpage> createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  Controller controller=Get.put(Controller());
  UsersModel? usersModel;
  List<UsersModel>? listUsers;
  List<PostModel>? listPost;
  List listUserName=[];

  @override
  void initState() {
    getData();
    super.initState();
  }
  getData() async {
    var responseUser=await controller.getUserData();
    listUsers = List<UsersModel>.from(responseUser.map((item)=> UsersModel.fromJson(item)).toList());




    var response=await controller.getAllPostData();
    listPost = List<PostModel>.from(response.map((item)=> PostModel.fromJson(item)).toList());

    for(var x in listPost!){
      for(var y in listUsers!){
        if(y.id==x.id){
          listUserName.add(y.username);
          break;
        }
      }
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(appBar: AppBar(title: Text("Posts"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: listPost==null?Center(child: CircularProgressIndicator()): listPost!.isEmpty?Center(child: Text("No Data Found")):
        ListView.builder(itemCount: listPost!.length,itemBuilder: (itemBuilder,index){
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>SinglePostPage(id: listPost![index].id!)));
            },
              child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(.2)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle,size: 30,),SizedBox(width: 8,),
                      Text(listUserName[index],style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Text("${listPost![index].title}",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("${listPost![index].body}"),


                ],),
              ),
            ),
          );
        }),
      ),
    );
  }


}
