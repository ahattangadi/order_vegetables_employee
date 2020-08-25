import 'package:flutter/material.dart';
import 'package:order_vegetables_employee/screens/home/settings_form.dart';
import 'package:order_vegetables_employee/services/auth.dart';
import 'package:order_vegetables_employee/services/database.dart';
import 'package:provider/provider.dart';
import 'package:order_vegetables_employee/screens/home/order_list.dart';
import 'package:order_vegetables_employee/models/orders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: SettingsForm(),
              ),
            );
          });
    }

    return StreamProvider<List<Orders>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('OV Admin'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('Sign out'),
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.add_circle,
              ),
              label: Text('Create a new order'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: Container(child: OrderList()),
      ),
    );
  }
}
