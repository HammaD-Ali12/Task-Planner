import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visual_planner/helper/helper.dart';
import 'package:visual_planner/modules/common/common_text_field.dart';
import 'package:visual_planner/modules/common/wide_filled_button.dart';
import 'package:visual_planner/routes/routes.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 162, 224, 214),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(237, 244, 243, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      "Forgot Password",
                      style: GoogleFonts.ubuntu(
                          color: primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Reset Your Password. Chech your email after clicking reset password button",
                    style: GoogleFonts.ubuntu(
                        //    color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonTextField(
                    icon: Icons.email,
                    hintText: "Email Address",
                    controller: emailController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 60.0),
                    child: WideFilledButton(
                        btnText: "Reset Password",
                        onTap: () {
                          Get.toNamed(Routes.otpScreen);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}