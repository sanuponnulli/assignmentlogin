import 'package:flutter/material.dart';
import 'package:login_flutter/main.dart';
import 'package:login_flutter/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screen1 extends StatelessWidget {
  screen1({Key? key}) : super(key: key);
  final _textcontroller = TextEditingController();
  final _textcontroller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "enter name"),
              controller: _textcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "enter password"),
              controller: _textcontroller1,
            ),
            ElevatedButton(
                onPressed: () {
                  checklogin(context);
                },
                child: Text("Login")),
          ],
        ),
      )),
    );
  }

  Future<void> savedata() async {
    // print(_textcontroller.text);
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setString("name", _textcontroller.text);
  }

  void checklogin(BuildContext ctx) {
    final text0 = _textcontroller.text;

    if (_textcontroller.text != "test@gmail.com" ||
        _textcontroller1.text != "12345678") {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text("wrong password or name"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } else if (text0.isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text("empty password or name"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      savedata();
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => screen2()));
    }
  }
}
