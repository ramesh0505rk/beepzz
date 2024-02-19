import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomMessage {
  Widget getBottomMessage() {
    return Expanded(
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
    );
  }
}
