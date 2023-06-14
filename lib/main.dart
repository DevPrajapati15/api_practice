import 'package:api_practice/Apis/ApiDemo/Presentation/Screens/api_demo_page.dart';
import 'package:flutter/material.dart';

import 'Apis/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: ApiDemoPage(),
    initialRoute: MyRoutes.apiDemoPageRoute,
    routes: {
      "/": (context) => ApiDemoPage(),
      MyRoutes.apiDemoPageRoute: (context) => const ApiDemoPage(),
    }
    );
  }
}


