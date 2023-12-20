import 'package:flutter/material.dart';
import 'package:swe463project/widget/log-in.dart';
import 'widget/metaphor_master_page.dart';

class MetaphorApp extends StatelessWidget {
  const MetaphorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metaphor App',
      initialRoute: '/login',
      routes: {
        '/home': (context) => const MetaphorMasterPage(),
        '/login': (context) => const LoginPage(),
      },

    );
  }
}
