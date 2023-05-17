import 'package:ecyzhi_flutter/screens/about.dart';
import 'package:ecyzhi_flutter/screens/blogs.dart';
import 'package:ecyzhi_flutter/screens/experiences.dart';
import 'package:ecyzhi_flutter/screens/skills.dart';
import 'package:ecyzhi_flutter/screens/works.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key, required this.navKeys});
  final List<GlobalKey> navKeys;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AboutWidget(key: navKeys[0]),
        const SizedBox(height: 50),
        SkillsWidget(key: navKeys[1]),
        const SizedBox(height: 50),
        ExperienceWidget(key: navKeys[2]),
        const SizedBox(height: 50),
        WorkWidget(key: navKeys[3]),
        const SizedBox(height: 25),
        const Divider(),
        const SizedBox(height: 25),
        BlogWidget(key: navKeys[4]),
        const SizedBox(height: 50),
        // ContactWidget(key: navKeys[5]),
      ],
    );
  }
}
