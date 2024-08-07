import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/common/constants.dart';
import 'package:gamology_riverpod/presentation/pages/main_page.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('start scenario 1');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamology',
      theme: DarkTheme.themeData,
      home: const MainPage(),
    );
  }
}