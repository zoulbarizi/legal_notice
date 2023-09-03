import 'package:flutter/material.dart';
import 'package:legal_notice/src/utils/consts.dart';

import 'src/views/legal_notice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Consts.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Consts.mainColor),
        useMaterial3: true,
      ),
      home: const LegalNotice(),
    );
  }
}
