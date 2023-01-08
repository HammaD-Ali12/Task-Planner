import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    Key? key,
    required this.btnicon,
    required this.title,
    required this.subtitle,
    this.press,
  }) : super(key: key);
  final IconData btnicon;
  final String title, subtitle;
  final Function()? press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              btnicon,
              size: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
