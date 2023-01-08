import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visual_planner/helper/helper.dart';
import 'package:visual_planner/modules/common/wide_filled_button.dart';
import 'package:visual_planner/routes/routes.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 162, 224, 214),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.all(5.0),
          //color: Colors.white,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  //padding: EdgeInsets.all(20.0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(237, 244, 243, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Image(
                  image: const AssetImage("assets/images/otp.png"),
                  height: size.height * 0.2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Verification",
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: Text(
                  "Enter Yout verification Code",
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (value) {
                  print("OTP is $value");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.9,
                  child: WideFilledButton(
                    btnText: "Next",
                    onTap: () {
                      Get.toNamed(Routes.updatePassword);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
