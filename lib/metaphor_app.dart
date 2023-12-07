import 'package:flutter/material.dart';
import 'metaphor_master_page.dart';

class MetaphorApp extends StatelessWidget {
  const MetaphorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metaphor App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MetaphorMasterPage(),
      },
    );
  }
}
