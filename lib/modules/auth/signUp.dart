import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visual_planner/helper/helper.dart';
import 'package:visual_planner/modules/common/common_text_field.dart';
import 'package:visual_planner/modules/common/wide_filled_button.dart';
import 'package:visual_planner/routes/routes.dart';

import '../common/wide_outlined_button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 162, 224, 214),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: Get.height,
          width: Get.width,
          // color: Colors.white,
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
                  Center(
                    child: Image(
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                      height: size.height * 0.15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Get On Board!",
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Create your profile to start your journey",
                    style: GoogleFonts.ubuntu(
                        // color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextField(
                    icon: Icons.person_outline_outlined,
                    hintText: "User Name",
                    controller: userNameController,
                  ),
                  CommonTextField(
                    icon: Icons.email,
                    hintText: "Email Address",
                    controller: emailController,
                  ),
                  CommonTextField(
                    icon: Icons.phone,
                    hintText: "Phone Number",
                    controller: phoneController,
                  ),
                  CommonTextField(
                    icon: Icons.fingerprint,
                    hintText: "Password",
                    controller: passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: WideFilledButton(btnText: "Sign Up", onTap: () {}),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Text(
                        "OR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WideOutlinedButton(
                        btnText: "Google",
                        onTap: () {
                          Get.toNamed(Routes.homeScreen);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account?",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (Get.previousRoute == '/login') {
                            Get.back();
                          } else {
                            Get.toNamed(Routes.login);
                          }
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
