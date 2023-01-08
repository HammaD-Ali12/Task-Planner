import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'forget_pass_option_btn.dart';

class ForgetPasswordOption {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Make Selection",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Select one of the option below to reset the password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ForgetPasswordBtnWidget(
              btnicon: Icons.mail_outline_rounded,
              title: 'E-Mail',
              subtitle: 'Reset Via E-Mail Verification',
              press: () {
                Navigator.pop(context);
                Get.toNamed(Routes.forgotPassword);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ForgetPasswordBtnWidget(
              btnicon: Icons.mobile_friendly_rounded,
              title: 'Phone No',
              subtitle: 'Reset Via Phone Verification',
              press: () {
                Navigator.pop(context);
                Get.toNamed(Routes.phoneotpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
