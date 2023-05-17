import 'package:ecyzhi_flutter/body.dart';
import 'package:ecyzhi_flutter/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();
  double scrollOffset = 150;
  bool isTop = true;
  bool showNav = true;

  bool mobileNavToggle = false;
  bool showMobileNav = false;

  final List<GlobalKey> navKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  final List<String> navTitle = [
    'About',
    'Skills',
    'Experiences',
    'Works',
    'Blogs',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        if (scrollController.position.pixels > scrollOffset) showNav = false;
        isTop = scrollController.position.pixels < scrollOffset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: BodyWidget(navKeys: navKeys),
            ),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1240),
                alignment: Alignment.topLeft,
                child: ScreenTypeLayout.builder(
                  tablet: (context) => animatedMenu(context),
                  mobile: (context) => animatedMenuMobile(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget animatedMenu(BuildContext context) {
    return AnimatedContainer(
        // Need to give key to the AnimatedContainer since both the mobile and desktop nav are using AnimatedContainer,
        // and we need to mark the widget with key as well so that when ScreenTypeLayout rebuilds, it will not throw error due to the Tween animation lerp.
        key: const ValueKey('desktopNav'),
        constraints: const BoxConstraints(maxWidth: 1200),
        // To animate the width changes, we need to specify the width explicitly but cannot be double.infinity.
        // Due to the StackFit default for non-positioned child, the max width will not exceed the Stack width.
        // So this width will be shown with the margin and width correctly on the screen.
        // Although the width is not calculated manually by us.
        width: isTop ? MediaQuery.of(context).size.width : 45,
        duration: const Duration(milliseconds: 200),
        onEnd: () {
          // This is to prevent the nav options from showing up when the width is not fully expanded and throw overflow error.
          setState(() {
            showNav = isTop;
          });
        },
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: CustomStyle.cardShadow,
        ),
        child: MouseRegion(
          onEnter: (event) {
            if (!isTop) {
              setState(() {
                isTop = true;
              });
            }
          },
          onExit: (event) {
            if (!(scrollController.position.pixels < scrollOffset)) {
              setState(() {
                showNav = false;
                isTop = false;
              });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    scrollController.position.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.explicit),
                  ),
                ),
              ),
              if (showNav && MediaQuery.of(context).size.width > 600)
                Row(
                  children: navTitle
                      .take(navTitle.length - 1)
                      .map(
                        (e) => TextButton(
                          onPressed: () {
                            if (navKeys[navTitle.indexOf(e)].currentContext !=
                                null) {
                              Scrollable.ensureVisible(
                                navKeys[navTitle.indexOf(e)].currentContext!,
                                duration: const Duration(milliseconds: 500),
                              );
                            }
                          },
                          child: Text(
                            e,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              if (showNav)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: FilledButton(
                    onPressed: () {
                      if (navKeys[0].currentContext != null) {
                        Scrollable.ensureVisible(
                          navKeys[0].currentContext!,
                          duration: const Duration(milliseconds: 500),
                        );
                      }
                    },
                    child: Text(
                      navTitle[5],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }

  Widget animatedMenuMobile(BuildContext context) {
    return AnimatedContainer(
      key: const ValueKey('mobileNav'),
      constraints: const BoxConstraints(maxWidth: 1200),
      width: !mobileNavToggle ? 45 : 300,
      height: !mobileNavToggle ? 45 : MediaQuery.of(context).size.height,
      duration: const Duration(milliseconds: 200),
      onEnd: () {
        setState(() {
          showMobileNav = mobileNavToggle;
        });
      },
      margin: !mobileNavToggle ? const EdgeInsets.all(20) : EdgeInsets.zero,
      padding: mobileNavToggle ? const EdgeInsets.all(20) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: !mobileNavToggle ? BorderRadius.circular(50) : null,
        boxShadow: CustomStyle.cardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => setState(() {
                if (mobileNavToggle) {
                  showMobileNav = false;
                }
                mobileNavToggle = !mobileNavToggle;
              }),
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(!mobileNavToggle ? Icons.explicit : Icons.close),
              ),
            ),
          ),
          if (showMobileNav) ...[
            const SizedBox(height: 50),
            ...navTitle
                .take(navTitle.length - 1)
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        if (navKeys[navTitle.indexOf(e)].currentContext !=
                            null) {
                          Scrollable.ensureVisible(
                            navKeys[navTitle.indexOf(e)].currentContext!,
                            duration: const Duration(milliseconds: 500),
                          );
                          setState(() {
                            showMobileNav = false;
                            mobileNavToggle = !mobileNavToggle;
                          });
                        }
                      },
                      child: Text(
                        e,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                )
                .toList(),
            // Contact
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                onPressed: () {
                  if (navKeys[0].currentContext != null) {
                    Scrollable.ensureVisible(
                      navKeys[0].currentContext!,
                      duration: const Duration(milliseconds: 500),
                    );
                    setState(() {
                      showMobileNav = false;
                      mobileNavToggle = !mobileNavToggle;
                    });
                  }
                },
                child: Text(
                  navTitle[5],
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
