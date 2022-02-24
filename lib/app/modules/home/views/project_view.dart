// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/data.dart';

class ProjectsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      child: Stack(
        children: [
          Positioned(
            bottom: context.width * 0.01,
            left: context.width > 675
                ? -context.width * 0.3
                : -context.width * 0.1,
            child: BlurRingAnimation(
                size: Size(context.width, context.height), sizePercent: 0.5),
          ),
          Column(
              // direction: context.width > 675 ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: context.width > 675
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "My Projects"
                    .text
                    .bold
                    .white
                    .scale((context.width / 300).clamp(2, 5))
                    .make()
                    .px(context.width > 675 ? 64 : 32),
                // 10.squareBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: [
                            KProjectCard(
                              title: "Trinetra",
                              tags: "Flutter, Flask, Firebase",
                              desc:
                                  "An E-Biometric Attendance app which aims for a contactless , secure & accurate attendance which covers all the loopholes from the present Biometric System.",
                              githubLink:
                                  "https://github.com/KejariwalAyush/Trinetra",
                              width: context.width < 400
                                  ? context.width * 0.6
                                  : null,
                            ),
                            // 50.squareBox,
                            KProjectCard(
                              title: "Notify Me",
                              tags: "Flutter",
                              desc:
                                  "Get notified for available slots in your district. Uses your location to get district and state, so that you dont have to select it. Check all slots available in your district without any worries. Sort your District wise data with respect to pincodes.",
                              githubLink:
                                  "https://github.com/KejariwalAyush/notify_me",
                              width: context.width < 400
                                  ? context.width * 0.6
                                  : null,
                            )
                          ],
                        ),
                        15.squareBox,
                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: [
                            KProjectCard(
                              title: "SOAUrl",
                              tags: "Flutter, Flask",
                              desc:
                                  "A URL Shortener where user can shorten any valid link with custom name. After shortening a link User can sign in anywhere with help of google and track performance of the URL.",
                              githubLink:
                                  "https://github.com/KejariwalAyush/SOAUrl",
                              width: context.width < 400
                                  ? context.width * 0.6
                                  : null,
                            ),
                            // 50.squareBox,
                            KProjectCard(
                              title: "Zoom Automation",
                              tags: "Python-tkinter, PyAutoGUI",
                              desc:
                                  "A python script that automatically joins a zoom meeting based on your timetable. As soon as the current time matches any meeting time it opens the Zoom Desktop application.",
                              githubLink:
                                  "https://github.com/KejariwalAyush/Online-Class-Automation",
                              width: context.width < 400
                                  ? context.width * 0.6
                                  : null,
                            ),
                          ],
                        )
                      ],
                    ),
                    25.squareBox,
                    Align(
                            alignment: Alignment.centerRight,
                            child: "Show More...".text.color(kcPurple).make())
                        .onInkTap(() => js.context.callMethod('open', [
                              "https://github.com/KejariwalAyush?tab=repositories"
                            ]))
                        .px(context.width > 675 ? 64 : 32),
                    // 100.squareBox,
                  ],
                ).p(context.width > 675 ? 64 : 32),
              ]),
        ],
      ),
    );
  }
}
