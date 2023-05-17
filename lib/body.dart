import 'package:ecyzhi_flutter/screens/about.dart';
import 'package:ecyzhi_flutter/screens/blogs.dart';
import 'package:ecyzhi_flutter/screens/experiences.dart';
import 'package:ecyzhi_flutter/screens/skills.dart';
import 'package:ecyzhi_flutter/screens/works.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.itemScrollController,
    required this.scrollOffsetListener,
    required this.itemPositionsListener,
  });
  final ItemScrollController itemScrollController;
  final ScrollOffsetListener scrollOffsetListener;
  final ItemPositionsListener itemPositionsListener;

  List<Widget> get bodyWidgets => [
        const AboutWidget(),
        const SkillsWidget(),
        const ExperienceWidget(),
        const WorkWidget(),
        const BlogWidget(),
        // ContactWidget(),
      ];

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     AboutWidget(key: navKeys[0]),
    //     const SizedBox(height: 50),
    //     SkillsWidget(key: navKeys[1]),
    //     const SizedBox(height: 50),
    //     ExperienceWidget(key: navKeys[2]),
    //     const SizedBox(height: 50),
    //     WorkWidget(key: navKeys[3]),
    //     const SizedBox(height: 25),
    //     const Divider(),
    //     const SizedBox(height: 25),
    //     BlogWidget(key: navKeys[4]),
    //     const SizedBox(height: 50),
    //     // ContactWidget(key: navKeys[5]),
    //   ],
    // );

    return ScrollablePositionedList.separated(
      shrinkWrap: true,
      itemCount: bodyWidgets.length,
      itemBuilder: (context, index) => bodyWidgets[index],
      separatorBuilder: (context, index) => const SizedBox(height: 50),
      itemScrollController: itemScrollController,
      scrollOffsetListener: scrollOffsetListener,
      itemPositionsListener: itemPositionsListener,
    );

    // return ListView.separated(
    //   shrinkWrap: true,
    //   itemCount: bodyWidgets.length,
    //   itemBuilder: (context, index) => bodyWidgets[index],
    //   separatorBuilder: (context, index) => const SizedBox(height: 50),
    // );
  }
}
