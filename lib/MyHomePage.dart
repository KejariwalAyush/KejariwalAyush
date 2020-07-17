import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

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
      Image.network(
        'https://avatars0.githubusercontent.com/u/53415956?s=460&u=36af1e2bed940f8d45769feef50cb564cec69c29&v=4',
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
        width: 300,
      ),
      AnimatedContainer(
        width: width > 700 ? width * 0.5 : width,
        duration: Duration(seconds: 2),
        // color: Colors.amberAccent,
        curve: Curves.easeIn,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: 'Hey, I\'m\n',
                style: GoogleFonts.lemonada(
                    shadows: [Shadow(color: Colors.blueGrey, blurRadius: 1)],
                    color: Colors.amber,
                    fontSize: width * 0.05 > 30 ? 25 : width * 0.05,
                    // fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: 'Ayush Kejariwal',
                style: GoogleFonts.lemonada(
                    shadows: [Shadow(color: Colors.blueGrey, blurRadius: 2)],
                    color: Colors.tealAccent,
                    fontSize: width * 0.1 > 45 ? 45 : width * 0.1,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ]),
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
              width > 400
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
                              style: GoogleFonts.lemonada(),
                            ),
                          ),
                        )
                      ],
                    ),
              Stack(
                children: [
                  // if (width > 800)
                  Image.network(
                    'https://i.pinimg.com/originals/b1/5f/97/b15f97463be2583c0db7f9b8df8c84fd.gif',
                    fit: BoxFit.cover, width: width,
                    height: MediaQuery.of(context).size.height,
                    // scale: 30,
                    alignment: Alignment.center,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      width > 700
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
}
