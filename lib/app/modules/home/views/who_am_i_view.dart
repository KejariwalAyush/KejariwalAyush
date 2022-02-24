import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kejariwal_ayush/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

class WhoAmIView extends StatelessWidget {
  const WhoAmIView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleText = "Who Am I?";
    final descText =
        "I am a highly organized and detail-oriented student at Institute of Technical Education and Research (ITER), SOA University. Seeking an entry-level position as Software Engineer.\n\n- Served as an intern in several start-ups as Flutter Developer.\n- Published a Research paper on Springer in Information Security using Steganography.\n- Student Co-ordinator at CODEX (Coding community of ITER).\n- Chapter-Coordinator at GDSC ITER \n";

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
                  SizedBox(
                    width: context.width > 675 ? context.width * 0.45 : null,
                    height: context.width > 675 ? null : context.height * 0.45,
                    child: Image.asset("assets/images/work.png",
                        fit: BoxFit.contain),
                  ),
                  Expanded(
                    flex: 1,
                    child: [
                      titleText.text.bold.white
                          .scale((context.width / 300).clamp(2, 5))
                          .make(),
                      25.squareBox,
                      [
                        descText.text.white
                            .scale((context.width / 300).clamp(0, 1))
                            .make(),
                        15.squareBox,
                        [
                          [
                            "10+"
                                .text
                                .semiBold
                                .white
                                .scale((context.width / 300).clamp(0, 1.8))
                                .make(),
                            "Projects"
                                .text
                                .light
                                .white
                                .scale((context.width / 300).clamp(0, 1))
                                .make(),
                          ].column(),
                          30.squareBox,
                          [
                            "1k+"
                                .text
                                .semiBold
                                .white
                                .scale((context.width / 300).clamp(0, 1.8))
                                .make(),
                            "Commits"
                                .text
                                .light
                                .white
                                .scale((context.width / 300).clamp(0, 1))
                                .make(),
                          ].column(crossAlignment: CrossAxisAlignment.start),
                        ].row(),
                      ].column(crossAlignment: CrossAxisAlignment.start),
                      10.squareBox,
                    ]
                        .column(
                            crossAlignment: CrossAxisAlignment.start,
                            alignment: MainAxisAlignment.spaceAround)
                        .px(context.width > 675 ? 64 : 32),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
