import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:visual_planner/helper/helper.dart';
import 'package:visual_planner/modules/dashboard/components/header.dart';
import 'package:visual_planner/modules/dashboard/components/overview_header.dart';
import 'package:visual_planner/modules/dashboard/components/sidebar.dart';
import 'package:visual_planner/modules/dashboard/shared_components/chatting_card.dart';
import 'package:visual_planner/modules/dashboard/shared_components/get_premium_card.dart';
import 'package:visual_planner/modules/dashboard/shared_components/list_profile_image.dart';
import 'package:visual_planner/modules/dashboard/shared_components/progress_card.dart';
import 'package:visual_planner/modules/dashboard/shared_components/progress_report_card.dart';
import 'package:visual_planner/modules/dashboard/shared_components/project_card.dart';
import 'package:visual_planner/modules/dashboard/shared_components/responsive_builder.dart';
import 'package:visual_planner/modules/dashboard/shared_components/task_card.dart';
import 'package:visual_planner/modules/models/profile.dart';

import '../controllers/dashboardController.dart';
import 'components/active_project_card.dart';
import 'components/profile_tile.dart';
import 'components/recent_messages.dart';
import 'components/team_member.dart';

class DashboardScreen extends StatelessWidget {
  final dashboardController = DashboardController();
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ThemeData.dark();
    return Scaffold(
      key: dashboardController.scafolKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : Drawer(
              child: Padding(
                padding: const EdgeInsets.only(top: kSpacing),
                child: SIDEBAR(
                  data: dashboardController.getSelectedProject(),
                ),
              ),
            ),
      body: SingleChildScrollView(
        child: ResponsiveBuilder(
          mobileBuilder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(
                  height: kSpacing * (kIsWeb ? 1 : 2),
                ),
                buildHeader(
                  onPressedMenu: () => dashboardController.openDrawer(),
                ),
                const SizedBox(height: kSpacing / 2),
                Divider(),
                buildProfile(data: dashboardController.getProfil()),
                //const SizedBox(height: kSpacing),
                // buildHeader(
                //   onPressedMenu: () => dashboardController.openDrawer(),
                // ),
                const SizedBox(height: kSpacing),
                buildProgress(
                  axis: (constraints.maxWidth < 950)
                      ? Axis.vertical
                      : Axis.horizontal,
                ),
                const SizedBox(height: kSpacing),
                buildTeamMember(data: dashboardController.getMember()),
                const SizedBox(height: kSpacing * 2),
                const SizedBox(height: kSpacing),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                  child: GetPremiumCard(onPressed: () {}),
                ),
                buildTaskOverview(
                  data: dashboardController.getAllTask(),
                  headerAxis: (constraints.maxWidth < 850)
                      ? Axis.vertical
                      : Axis.horizontal,
                  crossAxisCount: 6,
                  crossAxisCellCount: (constraints.maxWidth < 950)
                      ? 6
                      : (constraints.maxWidth < 1360)
                          ? 3
                          : 2,
                ),
                const SizedBox(height: kSpacing * 2),
                buildActiveProject(
                  data: dashboardController.getActiveProject(),
                  crossAxisCount: 6,
                  crossAxisCellCount: (constraints.maxWidth < 950)
                      ? 6
                      : (constraints.maxWidth < 1360)
                          ? 3
                          : 2,
                ),
                // const SizedBox(height: kSpacing),

                // const Divider(thickness: 1),

                // const SizedBox(height: kSpacing),
                // const Divider(thickness: 1),
                const SizedBox(height: kSpacing),
                buildRecentMessages(data: dashboardController.getChatting()),
              ],
            );

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     // Flexible(
            //     //   flex: (constraints.maxWidth < 1360) ? 4 : 3,
            //     //   child: ClipRRect(
            //     //       borderRadius: BorderRadius.only(
            //     //         topRight: Radius.circular(kBorderRadius),
            //     //         bottomRight: Radius.circular(kBorderRadius),
            //     //       ),
            //     //       child: Sidebar(
            //     //           data: dashboardController.getSelectedProject())),
            //     // ),
            //     Flexible(
            //       flex: (constraints.maxWidth < 950) ? 6 : 9,
            //       child: Column(
            //         children: [

            //         ],
            //       ),
            //     ),
            //     Flexible(
            //       flex: 4,
            //       child: Column(
            //         children: [

            //         ],
            //       ),
            //     )
            //   ],
            // );
          },
          tabletBuilder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Flexible(
                //   flex: (constraints.maxWidth < 1360) ? 4 : 3,
                //   child: ClipRRect(
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(kBorderRadius),
                //         bottomRight: Radius.circular(kBorderRadius),
                //       ),
                //       child: Sidebar(
                //           data: dashboardController.getSelectedProject())),
                // ),
                Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: Column(
                    children: [
                      const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
                      buildHeader(
                        onPressedMenu: () => dashboardController.openDrawer(),
                      ),
                      const SizedBox(height: kSpacing * 2),
                      buildProgress(
                        axis: (constraints.maxWidth < 950)
                            ? Axis.vertical
                            : Axis.horizontal,
                      ),
                      const SizedBox(height: kSpacing * 2),
                      buildTaskOverview(
                        data: dashboardController.getAllTask(),
                        headerAxis: (constraints.maxWidth < 850)
                            ? Axis.vertical
                            : Axis.horizontal,
                        crossAxisCount: 6,
                        crossAxisCellCount: (constraints.maxWidth < 950)
                            ? 6
                            : (constraints.maxWidth < 1100)
                                ? 3
                                : 2,
                      ),
                      const SizedBox(height: kSpacing * 2),
                      buildActiveProject(
                        data: dashboardController.getActiveProject(),
                        crossAxisCount: 6,
                        crossAxisCellCount: (constraints.maxWidth < 950)
                            ? 6
                            : (constraints.maxWidth < 1100)
                                ? 3
                                : 2,
                      ),
                      const SizedBox(height: kSpacing),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      const SizedBox(height: kSpacing * (kIsWeb ? 0.5 : 1.5)),
                      buildProfile(data: dashboardController.getProfil()),
                      const Divider(thickness: 1),
                      const SizedBox(height: kSpacing),
                      buildTeamMember(data: dashboardController.getMember()),
                      const SizedBox(height: kSpacing),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kSpacing),
                        child: GetPremiumCard(onPressed: () {}),
                      ),
                      const SizedBox(height: kSpacing),
                      const Divider(thickness: 1),
                      const SizedBox(height: kSpacing),
                      buildRecentMessages(
                          data: dashboardController.getChatting()),
                    ],
                  ),
                )
              ],
            );
          },
          desktopBuilder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: (constraints.maxWidth < 1360) ? 4 : 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kBorderRadius),
                        bottomRight: Radius.circular(kBorderRadius),
                      ),
                      child: SIDEBAR(
                          data: dashboardController.getSelectedProject())),
                ),
                Flexible(
                  flex: 9,
                  child: Column(
                    children: [
                      const SizedBox(height: kSpacing),
                      buildHeader(),
                      const SizedBox(height: kSpacing * 2),
                      buildProgress(),
                      const SizedBox(height: kSpacing * 2),
                      buildTaskOverview(
                        data: dashboardController.getAllTask(),
                        crossAxisCount: 6,
                        crossAxisCellCount:
                            (constraints.maxWidth < 1360) ? 3 : 2,
                      ),
                      const SizedBox(height: kSpacing * 2),
                      buildActiveProject(
                        data: dashboardController.getActiveProject(),
                        crossAxisCount: 6,
                        crossAxisCellCount:
                            (constraints.maxWidth < 1360) ? 3 : 2,
                      ),
                      const SizedBox(height: kSpacing),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      const SizedBox(height: kSpacing / 2),
                      buildProfile(data: dashboardController.getProfil()),
                      const Divider(thickness: 1),
                      const SizedBox(height: kSpacing),
                      buildTeamMember(data: dashboardController.getMember()),
                      const SizedBox(height: kSpacing),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kSpacing),
                        child: GetPremiumCard(onPressed: () {}),
                      ),
                      const SizedBox(height: kSpacing),
                      const Divider(thickness: 1),
                      const SizedBox(height: kSpacing),
                      buildRecentMessages(
                          data: dashboardController.getChatting()),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildHeader({Function()? onPressedMenu}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          if (onPressedMenu != null)
            Padding(
              padding: const EdgeInsets.only(right: kSpacing),
              child: IconButton(
                onPressed: onPressedMenu,
                icon: Icon(EvaIcons.menu),
                tooltip: "menu",
              ),
            ),
          Expanded(child: Header()),
        ],
      ),
    );
  }

  Widget buildProgress({Axis axis = Axis.horizontal}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: (axis == Axis.horizontal)
            ? Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: ProgressCard(
                      data: const ProgressCardData(
                        totalUndone: 10,
                        totalTaskInProress: 2,
                      ),
                      onPressedCheck: () {},
                    ),
                  ),
                  const SizedBox(width: kSpacing / 2),
                  const Flexible(
                    flex: 4,
                    child: ProgressReportCard(
                      data: ProgressReportCardData(
                        title: "1st Sprint",
                        doneTask: 5,
                        percent: .3,
                        task: 3,
                        undoneTask: 2,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  ProgressCard(
                    data: const ProgressCardData(
                      totalUndone: 10,
                      totalTaskInProress: 2,
                    ),
                    onPressedCheck: () {},
                  ),
                  const SizedBox(height: kSpacing / 2),
                  const ProgressReportCard(
                    data: ProgressReportCardData(
                      title: "1st Sprint",
                      doneTask: 5,
                      percent: .3,
                      task: 3,
                      undoneTask: 2,
                    ),
                  ),
                ],
              ));
  }

  Widget buildTaskOverview({
    required List<TaskCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
    Axis headerAxis = Axis.horizontal,
  }) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: crossAxisCount,
      itemCount: data.length + 1,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: kSpacing),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return (index == 0)
            ? Padding(
                padding: const EdgeInsets.only(bottom: kSpacing),
                child: OverviewHeader(
                  axis: headerAxis,
                  onSelected: (task) {},
                ),
              )
            : TaskCard(
                data: data[index - 1],
                onPressedMore: () {},
                onPressedTask: () {},
                onPressedContributors: () {},
                onPressedComments: () {},
              );
      },
      staggeredTileBuilder: (index) =>
          StaggeredTile.fit((index == 0) ? crossAxisCount : crossAxisCellCount),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    //   child: Column(
    //     children: [
    //       const SizedBox(height: kSpacing),
    //       Row(
    //         children: data
    //             .map(
    //               (e) => Expanded(
    //                 child:
    //               ),
    //             )
    //             .toList(),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget buildActiveProject({
    required List<ProjectCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: ActiveProjectCard(
        onPressedSeeAll: () {},
        child: StaggeredGridView.countBuilder(
          crossAxisCount: crossAxisCount,
          itemCount: data.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: kSpacing,
          crossAxisSpacing: kSpacing,
          itemBuilder: (context, index) {
            return ProjectCard(data: data[index]);
          },
          staggeredTileBuilder: (index) =>
              StaggeredTile.fit(crossAxisCellCount),
        ),
      ),
    );
  }

  Widget buildProfile({required Profile data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: ProfilTile(
        data: data,
        onPressedNotification: () {},
      ),
    );
  }

  Widget buildTeamMember({required List<ImageProvider> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TeamMember(
            totalMember: data.length,
            onPressedAdd: () {},
          ),
          const SizedBox(height: kSpacing / 2),
          ListProfilImage(maxImages: 6, images: data),
        ],
      ),
    );
  }

  Widget buildRecentMessages({required List<ChattingCardData> data}) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: RecentMessages(onPressedMore: () {}),
      ),
      const SizedBox(height: kSpacing / 2),
      ...data
          .map(
            (e) => ChattingCard(data: e, onPressed: () {}),
          )
          .toList(),
    ]);
  }
}
