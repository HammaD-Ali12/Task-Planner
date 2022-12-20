import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visual_planner/helper/helper.dart';
import 'package:visual_planner/helper/onBoardingModels.dart';
import 'package:visual_planner/modules/common/wide_filled_button.dart';
import 'package:visual_planner/modules/common/wide_outlined_button.dart';
import 'package:visual_planner/modules/controllers/onBoardingController.dart';
import 'package:visual_planner/routes/routes.dart';

import '../common/onBoardingWidget.dart';

class onBoarding extends StatelessWidget {
  onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final BoardingController = onBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: BoardingController.pages,
            liquidController: BoardingController.controller,
            onPageChangeCallback: BoardingController.onPageChangeCallback,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => BoardingController.animatedToNextSlide(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.black26),
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.welcomeScreen);
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: BoardingController.currentPageIndex.value,
                count: 7,
                effect: WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
