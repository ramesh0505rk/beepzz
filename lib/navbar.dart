import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Navigation extends StatelessWidget {
  String email = "";
  Navigation(String emailValue) {
    email = emailValue;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFFBFBFBF),
          ),
          accountName: null,
          accountEmail: Text(
            'Email: ' + email,
            style: TextStyle(color: Colors.black),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: SvgPicture.asset(
                'icons/user.svg',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
