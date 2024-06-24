import 'package:flutter/material.dart';

import '../../../core/core.dart';

class SmHomeBottomNavigationBar extends StatelessWidget {
  const SmHomeBottomNavigationBar({
    super.key,
    required this.catSelectorNotifier,
  });
  final ValueNotifier catSelectorNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: catSelectorNotifier,
        builder: (_, selectedPage, child) {
          return AnimatedOpacity(
            opacity: selectedPage == -1 ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.translationValues(
                0,
                selectedPage == -1 ? 0 : 30,
                0,
              ),
              padding: const EdgeInsets.all(20),
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(SHIcons.lock),
                    ),
                    label: 'UNLOCK',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(SHIcons.home),
                    ),
                    label: 'MAIN',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(SHIcons.settings),
                    ),
                    label: 'SETTINGS',
                  ),
                ],
              ),
            ),
          );
        });
  }
}
