import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kejariwal_ayush/app/data/data.dart';
import 'package:kejariwal_ayush/app/modules/home/views/awards_view.dart';
import 'package:kejariwal_ayush/app/modules/home/views/ending_view.dart';
import 'package:kejariwal_ayush/app/modules/home/views/expirience_view.dart';
import 'package:kejariwal_ayush/app/modules/home/views/landing_view.dart';
import 'package:kejariwal_ayush/app/modules/home/views/project_view.dart';
import 'package:kejariwal_ayush/app/modules/home/views/who_am_i_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcDarkPurple,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LandingView(),
              WhoAmIView(),
              ProjectsView(),
              ExperienceView(),
              AwardsView(),
              EndingView(),
            ],
          ),
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (BuildContext context, int index) {
      //           // print(index.toString());
      //           switch (index) {
      //             case 0:
      //               return LandingView();
      //             case 1:
      //               return WhoAmIView();
      //             // case 2:
      //             //   return Body2ScreenView();
      //             // case 3:
      //             //   return Body3ScreenView();
      //             // case 4:
      //             //   return EndScreenView();
      //             default:
      //               return LandingView();
      //           }
      //         },
      //         childCount: 2,
      //         addAutomaticKeepAlives: true,
      //         addRepaintBoundaries: false,
      //         addSemanticIndexes: true,
      //       ),
      //     ),
      //   ],
      //   semanticChildCount: 2,
      //   controller: controller.scrollController,
      // ),
    );
  }
}
