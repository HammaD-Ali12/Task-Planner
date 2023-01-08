import 'package:flutter/material.dart';
import 'package:visual_planner/helper/helper.dart';

import '../shared_components/search_field.dart';
import '../shared_components/today_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TodayText(),
        const SizedBox(width: kSpacing),
        Expanded(child: SearchField()),
        const SizedBox(
          width: kSpacing,
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Row(
        //     children: [
        //       Text("List"),
        //       const SizedBox(
        //         width: kSpacing,
        //       ),
        //       Text("Board"),
        //       const SizedBox(
        //         width: kSpacing,
        //       ),
        //       Text("Calender"),
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   width: kSpacing,
        // ),
        // ElevatedButton(
        //   onPressed: () {},
        //   child: Row(
        //     children: [
        //       Icon(Icons.add),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       Text("Add Workplace"),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
