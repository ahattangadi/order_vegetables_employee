import 'package:flutter/material.dart';
import 'package:order_vegetables_employee/models/user.dart';
import 'package:order_vegetables_employee/screens/wrapper.dart';
import 'package:order_vegetables_employee/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
