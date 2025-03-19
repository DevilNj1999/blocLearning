import 'dart:convert';

import 'package:bloc_learning/api_services.dart';
import 'package:bloc_learning/app_router.dart';
import 'package:bloc_learning/cubit/counter_cubit.dart';
import 'package:bloc_learning/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'about_page.dart';
bool auth = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo  2',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      routerConfig: MyAppRouter().router ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final apiService=ApiService(baseUrl: "https://jsonplaceholder.typicode.com");

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPostData();
    super.initState();
  }

   Future getPostData() async{
    var response = await apiService.getRequest("/posts");


    return response.map((item)=>Post.fromJson(item)).toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text(widget.title),
      ),
      body: FutureBuilder(future: getPostData(), builder: (context,snap){
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading
        } else if (snap.hasError) {
          return Center(child: Text("Error: ${snap.error}")); // Show error
        } else if (!snap.hasData || snap.data!.isEmpty) {
          return Center(child: Text("No posts available new  ")); // Handle empty data
        }
        List posts =snap.data!;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context,item){
            Post post =snap.data![item];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            );

          }
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
GoRouter.of(context).pushNamed("about",pathParameters: {
  "name":"Nitesh"
});
} ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
