import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kejariwal_ayush/certificates.dart';
import 'package:kejariwal_ayush/projects.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var content = [
      CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 150,
        backgroundImage: NetworkImage(
          'https://avatars0.githubusercontent.com/u/53415956?s=460&u=36af1e2bed940f8d45769feef50cb564cec69c29&v=4',
        ),
      ),
      AnimatedContainer(
        width: width > 670 ? width * 0.4 : width,
        duration: Duration(seconds: 1),
        // color: Colors.amberAccent,
        curve: Curves.easeIn,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Hey, I\'m ',
                    style: GoogleFonts.novaSquare(
                        shadows: [
                          Shadow(color: Colors.blueGrey, blurRadius: 1)
                        ],
                        color: Colors.amber,
                        fontSize: width * 0.05 > 30 ? 25 : width * 0.05,
                        // fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ]),
              ),
              TypewriterAnimatedTextKit(
                text: ['Ayush Kejariwal '],
                textAlign: TextAlign.center,
                repeatForever: false,
                isRepeatingAnimation: false,
                speed: Duration(milliseconds: 250),
                textStyle: GoogleFonts.novaSquare(
                    shadows: [Shadow(color: Colors.blueGrey, blurRadius: 2)],
                    color: Colors.white,
                    fontSize: width * 0.1 > 45 ? 45 : width * 0.1,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInQuad,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () =>
                          _launchURL('https://www.github.com/KejariwalAyush'),
                      icon: Icon(
                        LineAwesomeIcons.github_square,
                        size: 35,
                      ),
                      tooltip: 'Github',
                    ),
                    IconButton(
                      onPressed: () => _launchURL(
                          'https://www.linkedin.com/in/ayush-kejariwal-1923a2191/'),
                      icon: Icon(
                        LineAwesomeIcons.linkedin_square,
                        size: 35,
                        color: Colors.lightBlueAccent,
                      ),
                      tooltip: 'LinkedIN',
                    ),
                    IconButton(
                      onPressed: () =>
                          _launchURL('https://www.instagram.com/a_kejariwal/'),
                      icon: Icon(
                        LineAwesomeIcons.instagram,
                        size: 35,
                        color: Colors.orangeAccent,
                      ),
                      tooltip: 'Instagram',
                    ),
                    IconButton(
                      onPressed: () => _launchURL(
                          'https://www.facebook.com/ayushkejariwal.ayush'),
                      icon: Icon(
                        LineAwesomeIcons.facebook,
                        size: 35,
                        color: Colors.blueAccent,
                      ),
                      tooltip: 'Facebook',
                    ),
                    Transform.rotate(
                      angle: 7 * pi / 4,
                      child: IconButton(
                        onPressed: () => _launchURL('https://t.me/a_kejriwal'),
                        icon: Icon(
                          LineAwesomeIcons.send_o,
                          size: 35,
                          color: Colors.blue[300],
                        ),
                        tooltip: 'Telegram(VPN)',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(width: 20.0, height: 100.0),
                  Text(
                    "I Love to ",
                    style: GoogleFonts.josefinSans(
                      fontSize: 25.0,
                    ),
                  ),
                  RotateAnimatedTextKit(
                    text: ["CODE.", "DESIGN.", "DEBUG."],
                    isRepeatingAnimation: true, repeatForever: true,
                    textStyle: GoogleFonts.josefinSans(
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.justify,
                    // alignment:
                    //     AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotateAnimatedTextKit(
                    text: [
                      "“Talk is cheap. Show me the code.”",
                      "“I'm not a great programmer;\nI'm just a good programmer with great habits.”",
                      "“Good design adds value faster than it adds cost.”",
                      "“There are two ways to write error-free programs;\nonly the third one works.”"
                    ],
                    duration: Duration(seconds: 8),
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    textStyle: GoogleFonts.josefinSans(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];

    // LAnguages List
    var languages = [
      for (var i in lang)
        Container(
          // width: 30,
          // height: 30,
          child: IconButton(
            icon: Image.asset(
              i,
              fit: BoxFit.contain,
              width: 30,
            ),
            onPressed: () {},
            tooltip: i.split('/')[2].split('.')[0].toUpperCase(),
          ),
        )
    ];

    var buttons = [
      Hero(
        tag: 'projects',
        child: RaisedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Projects(),
            ),
          ),
          animationDuration: Duration(milliseconds: 500),
          color: Colors.black54,
          hoverElevation: 30,
          hoverColor: Colors.amber,
          elevation: 5,
          child: Text('Projects'),
        ),
      ),
      Hero(
        tag: 'certificates',
        child: RaisedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Certificates(),
            ),
          ),
          animationDuration: Duration(milliseconds: 500),
          color: Colors.black54,
          hoverElevation: 30,
          hoverColor: Colors.amber,
          elevation: 5,
          child: Text('Certificates'),
        ),
      ),
    ];
    var content2 = [
      Container(
        padding: EdgeInsets.all(10),
        width: width > 670 ? width * 0.3 : width * 0.5,
        height: 200,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About Me 😎',
                style: GoogleFonts.novaSquare(
                  color: Colors.white,
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white54,
              ),
              TypewriterAnimatedTextKit(
                text: [
                  'I\'m a Student at ITER, SOA University, pursuing B.Tech in Computer Science & Engineering and a Flutter developer.\n'
                      '\nInspired by Codex and now a Student Coordinator at Codex.'
                ],
                textAlign: TextAlign.start,
                repeatForever: false,
                isRepeatingAnimation: false,
                speed: Duration(milliseconds: 100),
                textStyle: GoogleFonts.novaSquare(
                  shadows: [Shadow(color: Colors.blueGrey, blurRadius: 2)],
                  color: Colors.white,
                  // fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
        width: 20,
      ),
      AnimatedContainer(
        duration: Duration(
          seconds: 1,
        ),
        curve: Curves.easeIn,
        padding: EdgeInsets.all(10),
        width: width > 670 ? width * 0.3 : width * 0.5,
        height: width > 670 ? 200 : 250,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              width > 670
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buttons,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buttons,
                    ),
              RaisedButton(
                onPressed: () => _launchURL(
                    'mailto:kejayush29@gmail.com?subject=Want%20to%20have%20Coffee%20with%20you!!&body=I%20viewed%20your%20site%20and%20you%20did%20great%20work%20AYUSH!'),
                animationDuration: Duration(milliseconds: 500),
                color: Colors.black54,
                hoverElevation: 30,
                hoverColor: Colors.amber,
                elevation: 5,
                child: Text(
                  'Contact me 📧',
                  textAlign: TextAlign.center,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Programming\nLanguages: ',
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: languages,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      width > 670
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: content,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: content,
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      width > 670
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: content2,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: content2,
                            ),
                      SizedBox(
                        height: width > 670 ? 10 : 50,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white60,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

var lang = [
  'assets/lang/java.png',
  'assets/lang/python.png',
  'assets/lang/flutter.png',
  'assets/lang/dart.png',
  'assets/lang/json.png'
];
