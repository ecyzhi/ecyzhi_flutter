import 'package:ecyzhi_flutter/widgets/thumbnail_card_widget.dart';
import 'package:flutter/material.dart';

class WorkWidget extends StatelessWidget {
  const WorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Text(
              'My Works',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            ThumbnailCardWidget(
              title: 'AI-Tee',
              description:
                  'An application that allows user create their unique T-shirt with DallE AI generated images and payment gateway connected with Stripe.',
              techStack: const ['Flutter', 'Android', 'iOS', 'Firebase'],
              link: 'https://ecyzhi.com/ai_tee/',
              image: Image.asset(
                  'assets/images/works/ai_tee_website_screenshot.jpeg'),
            ),
          ],
        ),
      ),
    );
  }
}
