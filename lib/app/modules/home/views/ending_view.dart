// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kejariwal_ayush/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

class EndingView extends StatelessWidget {
  const EndingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height < 650 ? 600 : context.height * 0.85,
      child: Stack(
        children: [
          Positioned(
            top: context.width * 0.01,
            left: -context.width * 0.1,
            child: BlurRingAnimation(
                size: Size(context.width, context.height), sizePercent: 0.2),
          ),
          Positioned(
            bottom: -context.width * 0.1,
            right: -context.width * 0.1,
            child: BlurRingAnimation(size: Size(context.width, context.height)),
          ),
          Column(
            children: [
              10.squareBox,
              Expanded(
                child: Flex(
                    direction:
                        context.width > 675 ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: context.width > 675
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: context.width > 675
                              ? context.width * 0.35
                              : context.width * 0.5,
                          // height: context.height * 0.4,
                          child: Image.asset("assets/images/contact.png",
                              fit: BoxFit.contain),
                        ).px(context.width > 675 ? 64 : 32),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            child: [
                          "Let's make something\namazing together."
                              .text
                              .bold
                              .white
                              .scale((context.width / 300).clamp(1, 1.8))
                              .align(TextAlign.right)
                              .make(),
                          20.squareBox,
                          [
                            "Start with "
                                .text
                                .bold
                                .white
                                .scale((context.width / 300).clamp(1, 1.5))
                                .make(),
                            "saying hi"
                                .text
                                .bold
                                .color(kcPurple)
                                .scale((context.width / 300).clamp(1, 1.8))
                                .make()
                                .tooltip("kejayush29@gmail.com")
                                .onInkTap(() => js.context.callMethod("open", [
                                      "https://mail.google.com/mail/u/#inbox?compose=DmwnWsLKfqfbjmGRPcgXMnXkLPcqmBZntCbGnCTKtMGJJrpxrpcCwVmwvTdwdZfHHwSdrPjqJBpG"
                                    ])),
                          ].row(),
                          [
                            "Download my "
                                .text
                                .bold
                                .white
                                .scale((context.width / 300).clamp(1, 1.5))
                                .make(),
                            "resume"
                                .text
                                .bold
                                .color(kcPurple)
                                .scale((context.width / 300).clamp(1, 1.8))
                                .make()
                                .onInkTap(() => js.context.callMethod("open", [
                                      "https://drive.google.com/file/d/1Fsl3DgCvW30dLQDN8plHBnBuUJ51TRIF/view?usp=sharing"
                                    ])),
                          ].row()
                        ].column(crossAlignment: CrossAxisAlignment.end)),
                      ),
                    ]),
              ),
              15.squareBox,
              Expanded(
                child: Flex(
                    direction:
                        context.width > 675 ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: context.width > 675
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      [
                        "Check me out on Social Accounts"
                            .text
                            .bold
                            .white
                            .scale((context.width / 300).clamp(0, 1.5))
                            .make(),
                        10.squareBox,
                        SocialIcons(),
                      ].column(crossAlignment: CrossAxisAlignment.start),
                      [
                        "Find source code for this website here."
                            .text
                            .white
                            .scale((context.width / 300).clamp(0, 1.5))
                            .make()
                            .onInkTap(() => js.context.callMethod("open", [
                                  "https://github.com/KejariwalAyush/KejariwalAyush/tree/v2"
                                ])),
                        "Copyright © Ayush Kejariwal - 2022"
                            .text
                            .light
                            .white
                            .scale((context.width / 300).clamp(0, 1))
                            .make(),
                      ]
                          .column(
                              alignment: MainAxisAlignment.end,
                              crossAlignment: CrossAxisAlignment.end)
                          .py8(),
                    ]),
              ),
            ],
          ).px(context.width > 675 ? 64 : 32),
        ],
      ),
    );
  }
}
