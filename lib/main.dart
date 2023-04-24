import 'package:exam_24/screens/api_view/provider/api_provider.dart';
import 'package:exam_24/screens/api_view/view/api_view.dart';
import 'package:exam_24/screens/api_view/view/details_view.dart';
import 'package:exam_24/screens/home/view/home_view.dart';
import 'package:exam_24/screens/pattern_view/pattern_provider/pattern_provider.dart';
import 'package:exam_24/screens/pattern_view/view/pattern_voew.dart';
import 'package:exam_24/screens/todo_view/provider/todo_provider.dart';
import 'package:exam_24/screens/todo_view/view/log_in.dart';
import 'package:exam_24/screens/todo_view/view/register.dart';
import 'package:exam_24/screens/todo_view/view/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatternProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: 'pattern',
        routes: {
          '/': (context) => HomeView(),
          'pattern': (context) => PatternView(),
          'todo': (context) => TodoView(),
          'api': (context) => ApiView(),
          'detail': (context) => DetaislView(),
          'login': (context) => Login(),
          'reg': (context) => Register(),
          // 'enter': (context) => DataEnter(),
        },
      ),
    ),
  );
}
