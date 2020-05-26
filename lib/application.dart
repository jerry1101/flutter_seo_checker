import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/seo_checker_page.dart';


class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Tracker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SeoCheckerPage(),
    );
  }
}
