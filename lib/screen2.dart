import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_flutter/provider.dart';
import 'package:login_flutter/screen1.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);

  @override
  State<screen2> createState() => _screen2State();
}

String name = "";

class _screen2State extends State<screen2> {
  @override
  void initState() {
    //context.read<User>().getname;
    // TODO: implement initState
    d();
    super.initState();
  }

  void d() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString("name").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<User>().getname;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text(context.watch<User>().name()),
            Text(name),
            ElevatedButton(
                onPressed: () {
                  deldata();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => screen1()),
                      (route) => false);
                },
                child: Text("logout"))
          ],
        ),
      )),
    );
  }
}

Future<void> deldata() async {
  final sharedpref = await SharedPreferences.getInstance();
  sharedpref.remove("saved_value");
}
