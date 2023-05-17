import 'package:ecyzhi_flutter/widgets/card_widget.dart';
import 'package:ecyzhi_flutter/widgets/tech_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ThumbnailCardWidget extends StatefulWidget {
  const ThumbnailCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    this.link,
    this.image,
  });
  final String title;
  final String description;
  final List<String> techStack;
  final String? link;
  final Widget? image;

  @override
  State<ThumbnailCardWidget> createState() => _ThumbnailCardWidgetState();
}

class _ThumbnailCardWidgetState extends State<ThumbnailCardWidget> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;

    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (value) => setState(() => hovered = value),
      onTap: () =>
          widget.link != null ? launchUrl(Uri.parse(widget.link!)) : null,
      child: CardWidget(
        showShadow: hovered,
        child: Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            SizedBox(
              width: 200,
              height: 150,
              child: widget.image ?? const Placeholder(),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                          )),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.fade,
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: widget.techStack
                        .map((e) => TechChipWidget(title: e))
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
