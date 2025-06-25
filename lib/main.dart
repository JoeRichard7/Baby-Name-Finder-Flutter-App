import 'package:baby_name_app/routes/route_config.dart';
import 'package:baby_name_app/routes/route_names.dart';
import 'package:baby_name_app/screens/select_baby_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Name App',
      // home: ,
      initialRoute: RouteNames.selectBaby,
      onGenerateRoute: AppRoutes().onGenerateRoute,
    );
  }
}

