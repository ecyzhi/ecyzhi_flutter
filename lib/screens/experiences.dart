import 'package:ecyzhi_flutter/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                Text(
                  'My Experiences',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const ExperienceCardWidget(
                  date: 'July 2022 - Feb 2023',
                  title:
                      'Senior Software Design Engineer I @ vimigo Technologies',
                  descriptions: [
                    'Take part in various projects that made used of uploading files, geolocation and camera related features using Flutter.',
                    'Handling mobile application deployment.',
                    'Work closely with designer team and QA team to provide feedback on user experience and clarify requirements.',
                    'Demostrate progress to product owner every sprint as lead frontend developer of a talent acquistion application and assign task to juniors.',
                  ],
                  link: 'https://www.vimigoapp.com/home/',
                ),
                const ExperienceCardWidget(
                  date: 'July 2021 - Jun 2022',
                  title: 'Software Developer II @ vimigo Technologies',
                  descriptions: [
                    'Responsible in developing a leading performance reward system, Vimigo , which helps in growth of an organisation.',
                    'Develop both mobile and web applications using Flutter.',
                    'Work independently on frontend to create mobile application that integrate native SDK for RFID scanner and collaborate with external backend team.',
                    'Help in refactoring of legacy code to improve performance of the mobile applications.',
                  ],
                  link: 'https://www.vimigoapp.com/home/',
                ),
                const ExperienceCardWidget(
                  date: 'Feb 2020 - Jun 2021',
                  title: 'Software Engineer (Backend) @ Nettium',
                  descriptions: [
                    'Focus on building .NET API applications which allow clients to connect to our database through their dashboard.',
                    'Familiar with Microservice architecture and Domain Driven Design.',
                    'Used NLog for logging errors and information, Swagger to test and create documentation for API and Dapper for SQL query.',
                    'Written stored procedures with Transact-SQL.',
                  ],
                  link: 'https://www.nettium.net/',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ExperienceCardWidget extends StatefulWidget {
  const ExperienceCardWidget({
    super.key,
    required this.date,
    required this.title,
    required this.descriptions,
    this.link,
  });
  final String date;
  final String title;
  final List<String> descriptions;
  final String? link;

  @override
  State<ExperienceCardWidget> createState() => _ExperienceCardWidgetState();
}

class _ExperienceCardWidgetState extends State<ExperienceCardWidget> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    bool isDesktop =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop;

    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (value) => setState(() => hovered = value),
      onTap: () =>
          widget.link != null ? launchUrl(Uri.parse(widget.link!)) : null,
      child: CardWidget(
        showShadow: hovered,
        child: Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 10),
              child: Text(widget.date,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 10),
                  for (String desc in widget.descriptions)
                    Text('\u27a4 $desc',
                        style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
