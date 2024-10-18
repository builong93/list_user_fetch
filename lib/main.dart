import 'package:flutter/material.dart';
import 'package:list_user_fetch/ui/user_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const UserListPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
      ),
    );
  }
}
