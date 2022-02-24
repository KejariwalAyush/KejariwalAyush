// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/data.dart';

class ExperienceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      child: Stack(
        children: [
          Positioned(
            bottom: context.width * 0.01,
            right: context.width > 675
                ? -context.width * 0.05
                : -context.width * 0.01,
            child: BlurRingAnimation(
                size: Size(context.width, context.height), sizePercent: 0.3),
          ),
          Flex(
            direction: context.width > 675 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: context.width > 675
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width > 675 ? context.width * 0.45 : null,
                height: context.width > 675 ? null : context.height * 0.25,
                child: Image.asset("assets/images/Experience.png",
                    fit: BoxFit.contain),
              ).px(context.width > 675 ? 64 : 32),
              // 10.squareBox,
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "My Experiences"
                            .text
                            .bold
                            .white
                            .scale((context.width / 300).clamp(2, 5))
                            .make()
                            .px(context.width > 675 ? 64 : 32),
                      ),
                      20.squareBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KProjectCard(
                            title: "Congle",
                            tags:
                                "Chief Technical Officer\nJan, 2021 - Dec, 2021",
                            desc:
                                "Made MVP and tested it with over 500 users. Also Designed some components of the app and integrated Firebase & Google Cloud Platform.",
                            githubLink:
                                "https://drive.google.com/file/d/1YTxgPRm9P8u0y_WiiP9z3gy_NlpGP5Tn/view",
                            width: context.width * 0.75,
                          ),
                          10.squareBox,
                          KProjectCard(
                            title: "Zipu",
                            tags:
                                "Flutter Developer Intern\nDec, 2020 - Jan, 2021",
                            desc:
                                "Deployed it successfully to the Google Play Store within the first 1.5 months with over 200+ users. Integrated Rest API and Designed Frontend(UI) of the app.",
                            githubLink:
                                "https://play.google.com/store/apps/details?id=com.cubixquirrel.zipu",
                            width: context.width * 0.75,
                          ),
                        ],
                      ).px(context.width > 675 ? 64 : 32),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
