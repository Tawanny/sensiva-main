import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_common/ui_common.dart';

import 'core/core.dart';
import 'screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sensiva',
          theme: SHTheme.dark,
          home: const HomeScreen(),
        );
      },
    );
  }
}
