import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    GetMaterialApp(
      title: "Ayush Kejariwal",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.quicksandTextTheme()),
    ),
  );
}
