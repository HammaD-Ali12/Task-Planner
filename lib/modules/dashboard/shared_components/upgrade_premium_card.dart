import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:visual_planner/helper/helper.dart';

import '../../../routes/assets_paths.dart';

class UpgradePremiumCard extends StatelessWidget {
  const UpgradePremiumCard({
    required this.onPressed,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final Color? backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(kBorderRadius),
      color: backgroundColor ?? Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        onTap: onPressed,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 200,
            maxWidth: 250,
            minHeight: 150,
            maxHeight: 250,
          ),
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 80,
                ),
                child: Image(
                  image: AssetImage("assets/images/happy.png"),
                  fit: BoxFit.fitHeight,
                ),
                // child: SvgPicture.asset(
                //   ImageVectorPath.happy,
                //   fit: BoxFit.contain,
                // ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: _Info(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(height: 10),
        _price(),
        SizedBox(
          height: 10,
        ),
        _price1(),
        SizedBox(
          height: kSpacing,
        ),
      ],
    );
  }

  Widget _price() {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(Icons.add),
          SizedBox(
            width: kSpacing,
          ),
          Text("Add Project"),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.blue,
    //     borderRadius: BorderRadius.circular(5),
    //   ),
    //   padding: const EdgeInsets.all(20),
    //   child: RichText(
    //     text: TextSpan(
    //       style: TextStyle(
    //         fontSize: 10,
    //         color: kFontColorPallets[0],
    //         fontWeight: FontWeight.w200,
    //       ),
    //       children: [
    //         //  const TextSpan(text: "10\$ "),
    //         TextSpan(
    //           text: "Add Project",
    //           style: TextStyle(
    //             color: kFontColorPallets[1],
    //           ),
    //         ),
    //       ],
    //     ),
    //     maxLines: 1,
    //     overflow: TextOverflow.ellipsis,
    //   ),
    // );
  }

  Widget _price1() {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(Icons.add),
          SizedBox(
            width: kSpacing,
          ),
          Text("Add WorkPlace"),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
