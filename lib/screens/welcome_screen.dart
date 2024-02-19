import 'package:beepzz/ButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = ColorTween(
      begin: Colors.white,
      end: Colors.blueAccent,
    ).animate(controller!);

    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hola, bruh! '),
                    SvgPicture.asset(
                      'icons/message.svg',
                      width: 17,
                      height: 17,
                    ),
                  ],
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Expanded(
              flex: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Hero(
                            tag: 'logo',
                            child: Image(
                              image: AssetImage('images/memphis-cat-head.png'),
                              width: 70,
                              height: 70,
                            ),
                          ),
                          flex: 0,
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                        ),
                      ],
                    ),
                  ),
                  ButtonWidget().getButton(
                    btnName: 'Login',
                    context: context,
                  ),
                  ButtonWidget().getButton(
                    btnName: 'Register',
                    context: context,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'icons/pacman.svg',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    'Experience the lightning fast messaging.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
