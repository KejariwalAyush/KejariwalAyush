// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kejariwal_ayush/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

class AwardsView extends StatelessWidget {
  const AwardsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      child: Stack(
        children: [
          Positioned(
            top: context.width * 0.01,
            left: context.width > 675
                ? -context.width * 0.03
                : -context.width * 0.1,
            child: BlurRingAnimation(
                size: Size(context.width, context.height),
                sizePercent: context.width > 675 ? 0.15 : 0.35),
          ),
          Positioned(
            bottom: context.width * 0.02,
            right: -context.width * 0.03,
            child: BlurRingAnimation(
                size: Size(context.width, context.height),
                sizePercent: context.width > 675 ? 0.1 : 0.15),
          ),
          Center(
            child: Flex(
                direction:
                    context.width > 675 ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: context.width > 675
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleList(title: "🐱‍💻 Hackathons", heads: [
                          HeadLink("- Runner-up in Gear-Up Hackathon, 2021",
                              "https://www.linkedin.com/posts/coding-wizard-club_codingwizard-event-gearup2021-activity-6855189609089921025-pMLD"),
                          HeadLink("- Xperiments Redux, 2021",
                              "https://drive.google.com/file/d/1_nPodjB_rhUWqbKmbwGnskSxUUOSAHbz/view?usp=sharing"),
                          HeadLink("- Utkal Hacks 3.0, 2021",
                              "https://drive.google.com/file/d/1qeoIMsd7xt7ZECKnxtY0_jJXUr_86jNm/view?usp=sharing"),
                          HeadLink("- Codex CTF - 12 hrs, 2021",
                              "https://drive.google.com/file/d/1DPz6emHLncDUqW8u7eWnJPbz1iaw1d24/view?usp=sharing"),
                          HeadLink("- Participated in Hackerwar 2.0, 2020",
                              "https://drive.google.com/file/d/1XK4Zh9M4c0mPrwGTHkFL1iC5W-cSRnjM/view?usp=sharing"),
                        ]),
                        TitleList(title: "📜 Published Paper", heads: [
                          HeadLink(
                              "- Information Security using multi-media Steganography (Python), Springer Publication, 2019-20",
                              "https://link.springer.com/chapter/10.1007/978-981-15-6202-0_65"),
                        ]),
                        TitleList(title: "🏆 Recognitions", heads: [
                          HeadLink(
                              "- Student Coordinator of CODEX (The only Coding Club of ITER)",
                              ""),
                          HeadLink(
                              "- Chapter Coordinator at Google Developer Student Club (GDSC) of ITER",
                              "https://www.linkedin.com/posts/gdsciter_meet-our-team-activity-6847015302224482304-s9cb"),
                          HeadLink(
                              "- Completed Kharagpur Winter of Code (KWoC), 2020",
                              "https://drive.google.com/file/d/1-1o2Ej1J84YDOMde9kEAMMvX6AXZLgie/view?usp=sharing"),
                          HeadLink("- Completed Hacktoberfest, 2020", ""),
                          HeadLink("- Completed Hacktoberfest, 2021", ""),
                        ]),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: context.width > 675,
                    child: SizedBox(
                      // width: context.width > 675 ? context.width * 0.45 : null,
                      height: context.height * 0.4,
                      child: Image.asset("assets/images/awards.png",
                          fit: BoxFit.contain),
                    ).px(context.width > 675 ? 64 : 32),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class HeadLink {
  final String head;
  final String link;

  HeadLink(this.head, this.link);
}

class TitleList extends StatelessWidget {
  const TitleList({
    Key key,
    this.title,
    this.heads,
  }) : super(key: key);

  final String title;
  final List<HeadLink> heads;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: [
        title.text.bold.white.scale((context.width / 300).clamp(1, 3)).make(),
        15.squareBox,
        [
          for (var head in heads)
            head.head.text.white
                .scale((context.width / 300).clamp(0, 1))
                .make()
                .p4()
                .onInkTap(() => js.context.callMethod("open", [head.link])),
        ].column(crossAlignment: CrossAxisAlignment.start),
      ]
          .column(
              crossAlignment: CrossAxisAlignment.start,
              alignment: MainAxisAlignment.spaceAround)
          .px(context.width > 675 ? 64 : 32),
    );
  }
}
