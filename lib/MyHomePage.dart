import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
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
        width: width > 650 ? width * 0.4 : width,
        duration: Duration(seconds: 1),
        // color: Colors.amberAccent,
        curve: Curves.easeIn,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
                speed: Duration(milliseconds: 500),
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
                    IconButton(
                      onPressed: () =>
                          _launchURL('mailto:iteraio2020@gmail.com'),
                      icon: Icon(
                        LineAwesomeIcons.envelope,
                        size: 35,
                      ),
                      tooltip: 'Mail',
                    ),
                  ],
                ),
              ),
              Row(
                // mainAxisSize: MainAxisSize.c,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(width: 20.0, height: 100.0),
                  Text(
                    "I Love to ",
                    style: GoogleFonts.josefinSans(
                      fontSize: 30.0,
                    ),
                  ),
                  // SizedBox(width: 20.0, height: 100.0),
                  RotateAnimatedTextKit(
                    text: ["CODE.", "DESIGN.", "DEBUG."],
                    isRepeatingAnimation: true, repeatForever: true,
                    textStyle: GoogleFonts.josefinSans(
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.justify,
                    // alignment:
                    //     AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      // appBar: width > 400
      //     ? AppBar(
      //         toolbarHeight: 0,
      //       )
      //     : SliverAppBar(
      //         leading: Icon(Icons.menu),
      //       ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              width > 500
                  ? SizedBox(
                      // height: 30,
                      )
                  : AppBar(
                      leading: Icon(Icons.menu),
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      // bottomOpacity: 100,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'About',
                              style: GoogleFonts.novaSquare(),
                            ),
                          ),
                        )
                      ],
                    ),
              Stack(
                children: [
                  // if (width > 800)
                  // TODO: change background here
                  RotatedBox(
                    quarterTurns: width > 600 ? 0 : 2,
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/previews/000/184/640/original/triangle-abstract-black-background-vector.jpg',
                      fit: width > 600 ? BoxFit.cover : BoxFit.fitHeight,
                      gaplessPlayback: true,
                      width: width,
                      height: MediaQuery.of(context).size.height,
                      // scale: 30,
                      alignment: Alignment.center,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      width > 665
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
                    ],
                  ),
                ],
              ),
            ],
          ),
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
