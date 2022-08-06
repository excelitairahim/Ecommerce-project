import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider extends ChangeNotifier {
  String? usernam;
  String? useremail;
  bool? islogged;
  String? image;
  settoken(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value!);
    prefs.setBool(key, value!);
    print('hhhhh$value');
    print('hhhhh$value');
    print('hhhhh$value');
    print('hhhhh$value');
  }

  gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? 'Hello';
    String name = prefs.getString('name') ?? 'Hello';
   // bool? islogeed = prefs.getBool("islogged");
    String image = prefs.getString('image') ?? 'Hello';

    usernam = name;
    useremail = email;
    //islogged = islogeed;
    print(email + "<<<<<<,");
    print(name + "<<<<<<,");
    notifyListeners();
  }
  remove()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove("email");
            prefs.remove("name");
                prefs.remove("image");
  }
//   showToken()async{
//  await gettoken();
//  notifyListeners();
// }
}
