import 'package:flutter/material.dart';
import 'package:res_guard_ui/responsive/mobile_screen_layout.dart';
import 'package:res_guard_ui/responsive/responsive_layout_screen.dart';
import 'package:res_guard_ui/responsive/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservoir Guard',
      theme: ThemeData(
        primaryColor: const Color(0xFF0A0E21),
          scaffoldBackgroundColor: const Color(0xFF1F3B4D),
      ),
      home: const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
