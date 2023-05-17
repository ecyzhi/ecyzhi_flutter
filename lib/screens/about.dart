import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop;

    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/images/waves_opacity.svg',
            fit: BoxFit.cover,
            theme: SvgTheme(
                currentColor: Theme.of(context).colorScheme.primaryContainer),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              maxWidth: 1200,
            ),
            child: Flex(
              verticalDirection: VerticalDirection.up,
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: isDesktop
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.stretch,
              mainAxisAlignment: isDesktop
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Hello, my name is",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Yeap Lee Zhi",
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "I'm a Software Engineer",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Located in Malaysia. I have built several exceptional frontend and backend applications through out my career.",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "I'm passionate about beautiful interfaces and creating intuitive user experiences. Currently, I'm focused on building mobile and web applications.",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 10,
                        spacing: 20,
                        children: [
                          IconButton.filled(
                            onPressed: () => launchUrl(
                                Uri.parse('https://github.com/ecyzhi')),
                            icon: SvgPicture.asset(
                              'assets/images/github.svg',
                              width: 30,
                              theme: SvgTheme(
                                currentColor: Theme.of(context).canvasColor,
                              ),
                            ),
                          ),
                          IconButton.filled(
                            onPressed: () => launchUrl(Uri.parse(
                                'https://www.linkedin.com/in/yeapleezhi/')),
                            icon: SvgPicture.asset(
                              'assets/images/linkedin.svg',
                              width: 30,
                              theme: SvgTheme(
                                currentColor: Theme.of(context).canvasColor,
                              ),
                            ),
                          ),
                          FilledButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                              onPressed: () => launchUrl(Uri.parse(
                                  'assets/resume/Resume - YEAP LEE ZHI (2023).pdf')),
                              child: const Text("Download Resume")),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    height: getValueForScreenType(
                        context: context, mobile: 0, desktop: 500),
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
