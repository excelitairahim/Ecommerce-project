import 'dart:convert';

import 'package:fashion_design/otp_verification/otp_senderPage.dart';
import 'package:fashion_design/providers/cart_provider.dart';
import 'package:fashion_design/providers/login_signup.dart';
import 'package:fashion_design/providers/pagination_provider.dart';
import 'package:fashion_design/providers/product_provider.dart';
import 'package:fashion_design/providers/tokenstoreprovider.dart';
import 'package:fashion_design/screens/bottomnav_bar.dart';
import 'package:fashion_design/screens/login_signup.dart/login_and_signup.dart';
import 'package:fashion_design/screens/pagination_page.dart';
import 'package:fashion_design/screens/product_list.dart';
import 'package:fashion_design/screens/product_page.dart';
import 'package:fashion_design/screens/products_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'Google_login/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartProvider>(
          create: ((context) => CartProvider())),
      ChangeNotifierProvider<ProductProvider>(
          create: ((context) => ProductProvider())),
      ChangeNotifierProvider<SignupLogicModel>(
          create: ((context) => SignupLogicModel())),
       ChangeNotifierProvider<TokenProvider>(
      create: ((context) => TokenProvider())),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogginScreen(),
    ),
  ));
}
