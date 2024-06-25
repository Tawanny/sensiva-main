import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/theme/theme.dart';

import '../components/tabbar_item.dart';

class Aparatus extends StatelessWidget {
  const Aparatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                color: ThemeColors.prColor,
                borderRadius: BorderRadius.circular(30)),
            tabs: const [
              Tab(
                text: 'Bongs',
              ),
              TabbarItem(
                text: 'Lighters',
              ),
              TabbarItem(
                text: 'Rizzla',
              ),
              TabbarItem(
                text: 'Filters',
              ),
              TabbarItem(
                text: 'Oils',
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            children: [
              Container(color: Colors.transparent),
              Container(color: Colors.transparent),
              Container(color: Colors.transparent),
              Container(color: Colors.transparent),
              Container(color: Colors.transparent),
            ],
          ))
        ],
      ),
    );
  }
}
