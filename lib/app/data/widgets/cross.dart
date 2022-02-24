import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data.dart';

//Add this CustomPaint widget to the Widget Tree
class Cross extends StatelessWidget {
  const Cross({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            'x'.text.xl6.purple500.bold.make(),
            10.squareBox,
            'x'.text.xl.bold.purple500.make(),
            15.squareBox,
            'x'.text.xl3.bold.purple500.make(),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          height: size.width,
          width: size.width,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5, sigmaY: 5, tileMode: TileMode.repeated),
              child: Container(
                color: kcDarkPurple.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// An animated ring of circles that fills the available space.
// class CrossAnimation extends StatefulWidget {
//   /// The duration of a single loop. Defaults to 5 seconds.
//   final Duration loopLength;
//   final Size size;

//   CrossAnimation({
//     Key key,
//     @required this.size,
//     this.loopLength = const Duration(seconds: 5),
//   }) : super(key: key);

//   @override
//   _CrossAnimationState createState() => _CrossAnimationState();
// }

// class _CrossAnimationState extends State<CrossAnimation>
//     with SingleTickerProviderStateMixin {
//   /// The source of the animation. This controller goes repeatedly from `0`
//   /// to `1`.
//   AnimationController controller;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) => CustomPaint(
//         size: widget.size,
//         painter: CrossPainter(),
//         child: child,
//       ),
//     );
//   }

//   @override
//   void didUpdateWidget(CrossAnimation oldWidget) {
//     if (widget.loopLength != oldWidget.loopLength) {
//       controller.duration = widget.loopLength;
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         duration: widget.loopLength,
//         reverseDuration: widget.loopLength,
//         vsync: this);
//     controller.repeat(reverse: true);
//   }
// }

//Copy this CustomPainter code to the Bottom of the File
class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7824306, size.height * 0.04869125);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.3311375);
    path_0.cubicTo(
        size.width * 0.4058611,
        size.height * 0.2370292,
        size.width * 0.3116931,
        size.height * 0.1428292,
        size.width * 0.2175389,
        size.height * 0.04869125);
    path_0.cubicTo(
        size.width * 0.1086196,
        size.height * -0.06022806,
        size.width * -0.06021278,
        size.height * 0.1086651,
        size.width * 0.04861528,
        size.height * 0.2176153);
    path_0.cubicTo(
        size.width * 0.1427847,
        size.height * 0.3116931,
        size.width * 0.2369833,
        size.height * 0.4059069,
        size.width * 0.3310458,
        size.height * 0.5000458);
    path_0.cubicTo(
        size.width * 0.2369403,
        size.height * 0.5942264,
        size.width * 0.1427972,
        size.height * 0.6883708,
        size.width * 0.04861528,
        size.height * 0.7824764);
    path_0.cubicTo(
        size.width * -0.06021278,
        size.height * 0.8913653,
        size.width * 0.1086349,
        size.height * 1.060213,
        size.width * 0.2175389,
        size.height * 0.9514000);
    path_0.cubicTo(
        size.width * 0.3116778,
        size.height * 0.8572306,
        size.width * 0.4058458,
        size.height * 0.7630472,
        size.width * 0.4999847,
        size.height * 0.6689389);
    path_0.lineTo(size.width * 0.7824153, size.height * 0.9514000);
    path_0.cubicTo(
        size.width * 0.8913347,
        size.height * 1.060289,
        size.width * 1.060213,
        size.height * 0.8913806,
        size.width * 0.9513389,
        size.height * 0.7824764);
    path_0.cubicTo(
        size.width * 0.8571694,
        size.height * 0.6883069,
        size.width * 0.7630319,
        size.height * 0.5941681,
        size.width * 0.6688319,
        size.height * 0.5000153);
    path_0.cubicTo(
        size.width * 0.7630167,
        size.height * 0.4058458,
        size.width * 0.8571542,
        size.height * 0.3116778,
        size.width * 0.9513389,
        size.height * 0.2175236);
    path_0.cubicTo(
        size.width * 1.060228,
        size.height * 0.1086651,
        size.width * 0.8913500,
        size.height * -0.06022806,
        size.width * 0.7824153,
        size.height * 0.04875194);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff4448A4).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
