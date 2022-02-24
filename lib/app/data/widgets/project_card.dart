// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class KProjectCard extends StatelessWidget {
  const KProjectCard({
    Key key,
    @required this.title,
    @required this.desc,
    @required this.tags,
    @required this.githubLink,
    this.width,
  }) : super(key: key);

  final String title;
  final String desc;
  final String tags;
  final String githubLink;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => js.context.callMethod('open', [githubLink]),
      borderRadius: BorderRadius.circular(35),
      child: Container(
        padding: EdgeInsets.all(25),
        width: width ?? context.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white.withOpacity(0.3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title.text.semiBold
                .scale((context.width / 300).clamp(0, 2))
                .overflow(TextOverflow.ellipsis)
                .white
                .make(),
            tags.text.light
                .scale((context.width / 300).clamp(0, 1))
                .overflow(TextOverflow.ellipsis)
                .white
                .make(),
            20.squareBox,
            desc.text.white
                .scale((context.width / 300).clamp(0, 0.8))
                .maxLines(context.width < 400 ? 2 : 4)
                .overflow(TextOverflow.ellipsis)
                .make(),
          ],
        ),
      ),
    );
  }
}
