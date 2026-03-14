import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/homepage.dart';
import 'package:test_app/signup_screen.dart';

void main(){
  final GoRouter _router=GoRouter(
    initialLocation: "/signupscreen",
    routes:[
      GoRoute(path: "/signupscreen",
      builder: (context, state)=>SignupScreen(),
      ),
      GoRoute(path: "/homepage",
      builder: (context, state) => Homepage(),)
    ]);
  runApp(TestApp(router: _router));
}

class TestApp extends StatelessWidget {
  final GoRouter router;
  const TestApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       routerConfig: router,
       debugShowCheckedModeBanner: false,
    );
  }
}