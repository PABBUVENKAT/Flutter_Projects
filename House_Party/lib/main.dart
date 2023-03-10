import 'package:HouseParty/phone_verification.dart';
import 'package:HouseParty/welcome.dart';
import 'package:flutter/material.dart';

import 'Register.dart';
import 'Verify.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const welcome(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'welcome': (context) => const welcome(),
      'phone': (context) => const MyPhone(),
      'verify': (context) => const MyVerify(),
    },
  ));
}