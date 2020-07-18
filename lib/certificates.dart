import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kejariwal_ayush/imageView.dart';
import 'package:url_launcher/url_launcher.dart';

class Certificates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var certificateWidget = [
      for (int i = 0; i < cf.length; i++)
        Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(5),
            width: width > 670 ? width / (cf.length + 1) : width * 0.5,
            child: Hero(
              tag: cf[i],
              child: InkWell(
                autofocus: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageView(imgloc: cf[i]),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      cf[i],
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cfdetails[i],
                        style: GoogleFonts.novaSquare(fontSize: 10),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    ];
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // if (width > 800)
                  // TODO: change background here
                  width > 670
                      ? Image.asset(
                          'assets/background.jpg',
                          // 'https://static.vecteezy.com/system/resources/previews/000/184/640/original/triangle-abstract-black-background-vector.jpg',
                          fit: BoxFit.fill,
                          // repeat: ImageRepeat.repeatY,
                          gaplessPlayback: true,
                          width: width,
                          height: MediaQuery.of(context).size.height,
                          // scale: 30,
                          alignment: Alignment.center,
                        )
                      : Column(
                          children: [
                            Image.asset(
                              'assets/background.jpg',
                              // 'https://static.vecteezy.com/system/resources/previews/000/184/640/original/triangle-abstract-black-background-vector.jpg',
                              fit: BoxFit.fill,
                              // repeat: ImageRepeat.repeatY,
                              gaplessPlayback: true,
                              width: width,
                              height: MediaQuery.of(context).size.height,
                              // scale: 30,
                              alignment: Alignment.center,
                            ),
                            Image.asset(
                              'assets/background2.jpg',
                              // 'https://static.vecteezy.com/system/resources/previews/000/184/640/original/triangle-abstract-black-background-vector.jpg',
                              fit: BoxFit.fill,
                              // repeat: ImageRepeat.repeatY,
                              gaplessPlayback: true,
                              width: width,
                              height: MediaQuery.of(context).size.height,
                              // scale: 30,
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TypewriterAnimatedTextKit(
                        text: ['CERTIFICATES '],
                        textAlign: TextAlign.center,
                        repeatForever: false,
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 200),
                        textStyle: GoogleFonts.novaSquare(
                            shadows: [
                              Shadow(color: Colors.blueGrey, blurRadius: 2)
                            ],
                            color: Colors.white,
                            fontSize: width * 0.1 > 45 ? 45 : width * 0.1,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Divider(
                        thickness: 1,
                        height: 20,
                      ),
                      width > 670
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: certificateWidget,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: certificateWidget,
                            ),
                      Divider(
                        thickness: 2,
                        color: Colors.white60,
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white54,
        hoverColor: Colors.amber,
        hoverElevation: 30,
        child: Icon(Icons.arrow_back),
        tooltip: 'Back to Home',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      bottomSheet: Center(
        heightFactor: 1,
        child: RichText(
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '© Ayush Kejariwal 2020  |  ',
              style: GoogleFonts.novaSquare(
                color: Colors.white,
              ),
              children: [
                TextSpan(
                    text: 'Give a Feedback',
                    style: GoogleFonts.novaSquare(
                        color: Colors.amber,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL(
                            'https://support.github.com/contact/feedback?category=profile&subject=Profile+README');
                      }),
                TextSpan(
                  text: '  |  ',
                  style: GoogleFonts.novaSquare(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: 'CODEX',
                    style: GoogleFonts.novaSquare(
                        color: Colors.amber,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL('https://codex-iter.github.io/');
                      })
              ]),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    return;
  }
}

var cf = [
  'assets/certificates/ICICC.jpg',
  'assets/certificates/hackerwar.jpg',
  'assets/certificates/flutter.jpg',
];
var cfdetails = [
  'ICICC for Multi-media Steganography',
  'Hackerwar 2.0',
  'Introduction to Flutter Dev. using dart',
];
