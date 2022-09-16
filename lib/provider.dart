import 'package:flutter/material.dart';
import 'package:login_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User with ChangeNotifier {
  String _name = "noooo";
  String get name => _name;

  Future<void> getname() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _name = sp.getString("name").toString();
    notifyListeners();
  }
}
