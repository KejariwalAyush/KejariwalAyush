// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width > 675 ? context.width * 0.25 : context.width,
      child: Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        // runSpacing: 16,
        // spacing: 16,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Image.asset(
            'assets/icons/Github.png',
            fit: BoxFit.scaleDown,
          ).scale50().onInkTap(() => js.context
              .callMethod('open', ["https://github.com/KejariwalAyush"])),
          Image.asset(
            'assets/icons/Linkedin.png',
            fit: BoxFit.scaleDown,
          ).scale50().onInkTap(() => js.context.callMethod(
              'open', ["https://www.linkedin.com/in/kejariwalayush/"])),
          Image.asset(
            'assets/icons/Medium.png',
            fit: BoxFit.scaleDown,
          ).scale50().onInkTap(() => js.context
              .callMethod('open', ["https://medium.com/@kejariwalayush"])),
          Image.asset(
            'assets/icons/Instagram.png',
            fit: BoxFit.scaleDown,
          ).scale50().onInkTap(() => js.context
              .callMethod('open', ["https://www.instagram.com/a_kejariwal"])),
          Image.asset(
            'assets/icons/Twitter.png',
            fit: BoxFit.scaleDown,
          ).scale(scaleValue: 0.35).onInkTap(() => js.context
              .callMethod('open', ["https://twitter.com/a_kejariwal"])),
          Image.asset(
            'assets/icons/Facebook.png',
            fit: BoxFit.scaleDown,
          ).scale50().onInkTap(() => js.context.callMethod(
              'open', ["https://www.facebook.com/ayushkejariwal.ayush"])),
        ],
      ),
    );
  }
}
