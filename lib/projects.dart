import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var projectWidget = [
      for (int i = 0; i < projectTitle.length; i++)
        Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(15),
            margin: width > 670 ? EdgeInsets.all(5) : EdgeInsets.all(20),
            // width:
            //     width > 670 ? width / (projectTitle.length + 1) : width * 0.5,
            child: Hero(
              tag: projectTitle[i],
              child: InkWell(
                autofocus: true,
                onTap: null,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(15),
                      enabled: true,
                      hoverColor: Colors.amber[900],
                      tileColor: Colors.black45,
                      leading: IconButton(
                        icon: Icon(LineAwesomeIcons.github_square),
                        onPressed: () => _launchURL(projectlink[i]),
                        tooltip: 'Open on Github',
                      ),
                      title: Text(projectTitle[i],
                          overflow: TextOverflow.visible,
                          style: GoogleFonts.novaSquare(
                              fontSize: 25, color: Colors.white)),
                      subtitle: Text(projectDescription[i],
                          overflow: TextOverflow.visible,
                          style: GoogleFonts.novaSquare(
                              fontSize: 15, color: Colors.white54)),
                    ),
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
                        text: ['PROJECTS '],
                        textAlign: TextAlign.center,
                        repeatForever: false,
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 250),
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
                      // width > 670
                      //     ? SingleChildScrollView(
                      //         scrollDirection: Axis.horizontal,
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceEvenly,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: certificateWidget,
                      //         ),
                      //       )
                      //     :
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: width > 670 ? width * 0.8 : width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: projectWidget,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white60,
                        height: 20,
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

var projectTitle = [
  'Information Security using Multi-Media Steganography',
  'NCOV-19',
  'Chess Game',
];
var projectReadmeLink = [
  'https://github.com/KejariwalAyush/Information-Security-using-Multi-Media-Steganography/blob/master/ReadMe.md',
  'https://github.com/KejariwalAyush/NCOV-19/blob/master/README.md',
  'https://github.com/KejariwalAyush/Chess-Game/blob/master/README.md',
];
var projectlink = [
  'https://github.com/KejariwalAyush/Information-Security-using-Multi-Media-Steganography',
  'https://github.com/KejariwalAyush/NCOV-19',
  'https://github.com/KejariwalAyush/Chess-Game',
];
var projectDescription = [
  'A message can be encrypted or can be hidden in text, image, audio & video file.\nThis is made using Python - openCV',
  'A basic app which keeps you Update on CORONA virus outbreak.\nThis is made using Flutter',
  'An offline two player Chess Game.\nThis is made using Java - Swing',
];
