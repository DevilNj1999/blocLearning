
import 'package:bloc_learning/about_page.dart';
import 'package:bloc_learning/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'error.dart';

class MyAppRouter{

  GoRouter router =GoRouter(routes: [
    GoRoute(path: "/",name: "home",pageBuilder: (context,state){
      return MaterialPage(child: MyHomePage(title: "Home Page"));
    }),
    GoRoute(path: "/about/:name",name: "about",
        pageBuilder: (context,state){
      return MaterialPage(child: About(name: state.pathParameters["name"]!,));
    }),
  ],
    errorPageBuilder: (context,state){
      return MaterialPage(child: ErrorPage());
    },
  );

}