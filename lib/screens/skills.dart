import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecyzhi_flutter/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  List<String> get logo => [
        'assets/images/flutter_logo.svg',
        'assets/images/dart_logo.svg',
        'assets/images/html_logo.svg',
        'assets/images/css_logo.svg',
        'assets/images/js_logo.svg',
        'assets/images/bootstrap_logo.svg',
        'assets/images/dotnet_logo.svg',
        'assets/images/nodejs_logo.svg',
      ];

  List<Widget> get skillCards => [
        const SkillCardWidget(
          title: "Frontend",
          value: 85,
          colors: [Color(0xFFFF6F9F), Color(0xFF9C27B0)],
          skills: ["Flutter", "HTML", "CSS", "Javascript", "Bootstrap"],
        ),
        const SkillCardWidget(
          title: "Backend",
          value: 70,
          colors: [Color(0xFF5BCBFF), Color(0xFF4CAF50)],
          skills: [".NET", "NodeJS"],
        ),
        const SkillCardWidget(
          title: "Tools",
          value: 80,
          colors: [Color(0xFFFFEB3B), Color(0xFFF44336)],
          skills: ["AWS", "Firebase", "Azure", "Postman", "Git", "JIRA"],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                child: Transform.rotate(
                  angle: -5 / 180 * math.pi,
                  child: CarouselSlider(
                    disableGesture: true,
                    options: CarouselOptions(
                      height: 100,
                      viewportFraction: math.max(
                          200 / MediaQuery.of(context).size.width, 200 / 1200),
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayCurve: Curves.linear,
                      autoPlayInterval: const Duration(milliseconds: 1000),
                      scrollDirection: Axis.horizontal,
                    ),
                    items: logo
                        .map((i) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: SvgPicture.asset(i),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            ScreenTypeLayout.builder(
              desktop: (context) => Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: skillCards[0],
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: skillCards[1],
                      ),
                      TableCell(child: skillCards[2]),
                    ],
                  ),
                ],
              ),
              mobile: (context) => ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: skillCards.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) => skillCards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCardWidget extends StatelessWidget {
  const SkillCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.colors,
    required this.skills,
  });
  final String title;
  final double value;
  final List<Color> colors;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: ScreenTypeLayout.builder(
        desktop: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child:
                  SkillGaugeWidget(title: title, value: value, colors: colors),
            ),
            const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skills.length,
              itemBuilder: (context, index) => Center(
                child: Text(
                  skills[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
        mobile: (context) => Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child:
                  SkillGaugeWidget(title: title, value: value, colors: colors),
            ),
            SizedBox(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                itemBuilder: (context, index) => Text(
                  skills[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillGaugeWidget extends StatelessWidget {
  const SkillGaugeWidget({
    super.key,
    required this.value,
    required this.title,
    required this.colors,
  });
  final double value;
  final String title;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
      initialValue: 0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
      value: value,
      progressBar: GaugeRoundedProgressBar(
        gradient: GaugeAxisGradient(colors: colors),
      ),
      axis: GaugeAxis(
        min: 0,
        max: 100,
        degrees: 300,
        style: const GaugeAxisStyle(
          thickness: 20,
          background: Color(0xFFDFE2EC),
        ),
        pointer: NeedlePointer(
          position: const GaugePointerPosition.surface(
            offset: Offset(0, 20),
          ),
          size: const Size(20, 30),
          borderRadius: 10,
          backgroundColor: const Color(0xFF193663),
        ),
      ),
      builder: (context, child, value) {
        return Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      },
    );
  }
}
