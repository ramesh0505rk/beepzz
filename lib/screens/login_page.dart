import 'package:beepzz/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

bool visibility = true;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String? email, password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Align(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Image(
                          image: AssetImage('images/memphis-cat-head.png'),
                          width: 110,
                          height: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'DelaGothicOne',
                          color: Colors.black,
                          fontSize: 45,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('Beepzz',
                                speed: Duration(milliseconds: 350)),
                          ],
                          totalRepeatCount: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onChanged: (value) {
                          email = value;
                        },
                        cursorColor: Colors.black,
                        decoration: decorations(
                          iconPath: 'icons/at.svg',
                          hintText: 'Enter your email',
                          secureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        obscureText: visibility,
                        onChanged: (value) {
                          password = value;
                        },
                        cursorColor: Colors.black,
                        decoration: decorations(
                          iconPath: 'icons/key.svg',
                          hintText: 'Enter your password',
                          secureText: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email!, password: password!);
                            if (user != null) {
                              Navigator.pushNamed(context, '/chat');
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStatePropertyAll(Size(230, 60)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ))),
                      ),
                    ),
                  ],
                ),
              ),
              BottomMessage().getBottomMessage(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration decorations(
      {String? iconPath, String? hintText, bool? secureText}) {
    return InputDecoration(
      prefixIcon: SvgPicture.asset(
        iconPath!,
        fit: BoxFit.scaleDown,
        color: Colors.black,
      ),
      suffixIcon: (!secureText!)
          ? null
          : IconButton(
              icon: (visibility)
                  ? Icon(
                      Icons.visibility,
                    )
                  : Icon(Icons.visibility_off),
              onPressed: () {
                if (visibility == true) {
                  setState(() {
                    visibility = false;
                  });
                } else {
                  setState(() {
                    visibility = true;
                  });
                }
              },
            ),
      filled: true,
      fillColor: Color(0xFFBFBFBF),
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      ),
    );
  }
}
//Color(0xFFBFBFBF)
