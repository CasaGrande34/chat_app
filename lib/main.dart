import 'package:flutter/material.dart';
//file addresses
import 'package:chat_app/router/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatt app',
      initialRoute: '/chat',
      routes: routesMap,
    );
  }
}