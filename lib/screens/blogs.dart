import 'package:ecyzhi_flutter/widgets/thumbnail_card_widget.dart';
import 'package:flutter/material.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Text(
              'My Blogs',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            ThumbnailCardWidget(
              title: 'Spreading Card Animation',
              description:
                  'An approach to try to implement spreading cards in Flutter without the use of packages.',
              techStack: const ['Flutter'],
              link: 'https://ecyzhi.com/blogs/spreading_card_animation.html',
              image: Image.asset('assets/images/blogs/card_6.gif'),
            ),
          ],
        ),
      ),
    );
  }
}
