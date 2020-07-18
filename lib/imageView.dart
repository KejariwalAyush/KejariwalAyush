import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageView extends StatelessWidget {
  String imgloc;
  ImageView({@required this.imgloc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Hero(tag: imgloc, child: Image.asset(imgloc))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white54,
        hoverColor: Colors.amber,
        hoverElevation: 30,
        child: Icon(Icons.arrow_back),
        tooltip: 'Back to Certificates',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
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
