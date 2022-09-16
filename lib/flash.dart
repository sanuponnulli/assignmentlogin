import 'package:flutter/material.dart';
import 'package:login_flutter/screen1.dart';
import 'package:login_flutter/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class flash extends StatefulWidget {
  const flash({Key? key}) : super(key: key);

  @override
  State<flash> createState() => _flashState();
}

class _flashState extends State<flash> {
  @override
  void initState() {
    getdata(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

Future<void> getdata(BuildContext context) async {
  final sharedpref = await SharedPreferences.getInstance();
  final savedvalue = sharedpref.getString("name");
  await Future.delayed(Duration(seconds: 3));
  if (savedvalue != null) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => screen2()));
  } else {
    gotologin(context);
  }
}

Future<void> gotologin(BuildContext context) async {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (ctx) => screen1()));
}
