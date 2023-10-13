import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg/Posts.dart';
import 'package:nmg/usersScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController? tabController;
  int index=0;
  var pages=[
    UsersSceen(),
    Postpage(),
  ];

  @override
  void initState() {
    super.initState();
    tabController=TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      index=tabController!.index;
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: TabBar(controller: tabController,tabs: [
        Tab(icon: Icon(Icons.account_circle),text: "users",),
        Tab(icon: Icon(Icons.signpost),text: "Posts",),
      ]),
    );
  }
}
