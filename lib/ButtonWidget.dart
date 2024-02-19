import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget {
  Widget getButton(
      {String? btnName, BuildContext? context, Function? onPressed}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ElevatedButton(
        onPressed: () {
          if (btnName == 'Login')
            Navigator.pushNamed(context!, '/login');
          else
            Navigator.pushNamed(context!, '/register');
        },
        child: Text(
          btnName!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(Colors.black),
          minimumSize: MaterialStatePropertyAll(Size(340, 60)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
