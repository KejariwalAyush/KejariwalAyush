import 'dart:ui';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kejariwal_ayush/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headText = "Hey, I'm";
    final nameText = "Ayush Kejariwal";
    final descText =
        'A demonstrated history of working in the computer software industry. Skilled in Flutter.\n\nI love to CODE, DESIGN & DEBUG.';
    return Container(
      width: context.width,
      height: context.height < 650
          ? 675
          : context.height > 900
              ? 850
              : context.height,
      child: Stack(
        children: [
          Positioned(
            top: -context.width * 0.1,
            left: -context.width * 0.1,
            child: BlurRingAnimation(size: Size(context.width, context.height)),
          ),
          // Positioned(
          //   bottom: context.width * 0.01,
          //   right: -context.width * 0.1,
          //   child: BlurRingAnimation(
          //       size: Size(context.width, context.height), sizePercent: 0.2),
          // ),
          Flex(
              direction: context.width > 675 ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: context.width > 675
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 40.squareBox,
                      [
                        headText.text.light.white
                            .scale((context.width / 300).clamp(0, 1.5))
                            .make(),
                        nameText.text.bold.white
                            .scale((context.width / 300).clamp(3, 5))
                            .make(),
                      ].column(
                          crossAlignment:
                              CrossAxisAlignment.start), // 40.squareBox,
                      descText.text.white
                          .scale((context.width / 300).clamp(0, 1))
                          .make(),
                      [
                        10.squareBox,
                        Container(
                          decoration: BoxDecoration(
                            color: kcPurple,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: 'Contact Me'
                              .text
                              .bold
                              .xl
                              .white
                              .make()
                              .px16()
                              .py16()
                              .tooltip("kejayush29@gmail.com")
                              .onInkTap(() => js.context.callMethod("open", [
                                    "https://mail.google.com/mail/u/#inbox?compose=DmwnWsLKfqfbjmGRPcgXMnXkLPcqmBZntCbGnCTKtMGJJrpxrpcCwVmwvTdwdZfHHwSdrPjqJBpG"
                                  ])),
                        ),
                        10.squareBox,
                        SocialIcons(),
                      ].column(crossAlignment: CrossAxisAlignment.start),
                    ],
                  ).p(context.width > 675 ? 64 : 32),
                ),
                Expanded(
                    flex: 4,
                    child: Avatar(size: Size(context.width, context.height)))
              ]),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final imgUrl = "https://avatars.githubusercontent.com/u/53415956?v=4";
    return Center(
      child: Stack(
        children: [
          VxCircle(
            backgroundColor: kcPurple.withOpacity(0.4),
            radius: context.width * 0.3,
          ).innerShadow(blur: 4).centered(),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                color: kcDarkPurple.withOpacity(0.25),
              ),
            ),
          ).centered(),
          VxCircle(
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(imgUrl)),
            radius: context.width * 0.29,
          ).innerShadow(blur: 4).centered(),
          BlurRingAnimation(
            size: size,
            sizePercent: 0.5,
            isBlured: false,
          ).centered(),
        ],
      ),
    );
  }
}
