import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kejariwal_ayush/app/data/colors.dart';
import 'dart:ui';
import 'package:get/get.dart';

import '../data.dart';

class BlurRingAnimation extends StatelessWidget {
  const BlurRingAnimation({
    Key key,
    @required this.size,
    this.sizePercent = 0.3,
    this.isBlured = true,
  }) : super(key: key);

  final Size size;
  final double sizePercent;
  final bool isBlured;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.width * sizePercent,
          width: size.width * sizePercent,
          child: RingOfCircles(2, loopLength: 10.seconds),
        ),
        if (isBlured)
          Positioned(
            top: 0,
            left: 0,
            height: size.width * sizePercent,
            width: size.width * sizePercent,
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
class RingOfCircles extends StatefulWidget {
  /// The number of circles to show.
  final int n;

  /// The duration of a single loop. Defaults to 5 seconds.
  final Duration loopLength;

  RingOfCircles(
    this.n, {
    Key key,
    this.loopLength = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  _RingOfCirclesState createState() => _RingOfCirclesState();
}

class _RingOfCirclesState extends State<RingOfCircles>
    with SingleTickerProviderStateMixin {
  /// The source of the animation. This controller goes repeatedly from `0`
  /// to `1`.
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => CustomPaint(
        painter: RingOfCirclesPainter(widget.n, controller.value),
        child: child,
      ),
      // child: Center(child: Text('${widget.n}', style: TextStyle(fontSize: 32))),
    );
  }

  @override
  void didUpdateWidget(RingOfCircles oldWidget) {
    if (widget.loopLength != oldWidget.loopLength) {
      controller.duration = widget.loopLength;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.loopLength, vsync: this);
    controller.repeat();
  }
}

/// A custom painter that renders a ring of [n] circles at time [t].
class RingOfCirclesPainter extends CustomPainter {
  final int n;
  final double t;

  RingOfCirclesPainter(this.n, this.t);

  double _ringRadius;
  double _waveRadius;
  double _ballRadius;
  double _gap;

  @override
  void paint(Canvas canvas, Size size) {
    _ringRadius = min(size.width, size.height) * 0.35;
    _waveRadius = min(size.width, size.height) * 0.10;
    _ballRadius = _waveRadius / 4;
    _gap = _ballRadius / 2;

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);

    for (var i = 0; i < n; i++) {
      drawCircle(canvas, i, false);
    }

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = kcPurple
      ..strokeWidth = (_ballRadius + _gap * 2);
    canvas.drawCircle(Offset.zero, _ringRadius, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = kcPurple
      ..strokeWidth = _ballRadius;
    canvas.drawCircle(Offset.zero, _ringRadius, paint);

    for (var i = 0; i < n; i++) {
      drawCircle(canvas, i, true);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(RingOfCirclesPainter oldDelegate) =>
      n != oldDelegate.n || t != oldDelegate.t;

  void drawCircle(Canvas canvas, int i, bool above) {
    var angle0 = (i / n - t) % 1 * (2 * pi);
    var angle1 = angle0 - t * (2 * pi);

    if (cos(angle1) < 0 == above) {
      return;
    }

    canvas.save();
    canvas.rotate(angle0);
    canvas.translate((_ringRadius + sin(angle1) * _waveRadius), 0);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = kcPurple
      ..strokeWidth = (_gap * 2);
    canvas.drawCircle(Offset.zero, _ballRadius, paint);

    paint
      ..style = PaintingStyle.fill
      ..color = kcPurple;
    canvas.drawCircle(Offset.zero, _ballRadius, paint);

    canvas.restore();
  }
}
