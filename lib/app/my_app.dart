import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visual_planner/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Planner',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
      ),
      initialRoute: Routes.splashScreen,
      getPages: Routes.getPages,
    );
  }
}
