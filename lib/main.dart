import 'package:flutter/material.dart';
//import 'package:todo/colors.dart';

import 'package:todo/main_page.dart';
import 'package:todo/task_page.dart';

import 'colors.dart';

void main() => runApp(GrinchApp());

class GrinchApp extends StatefulWidget {
  @override
  _GrinchAppState createState() => _GrinchAppState();
}

class _GrinchAppState extends State<GrinchApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO Grinch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: GrinchTheme.primaryColor,
        accentColor: GrinchTheme.accentColor,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.blueGrey[200],
        cardColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/task':
            String arg = settings.arguments;

            return MaterialPageRoute(
              settings: settings,
              builder: (_) => TaskPage(
                type: arg,
              ),
            );
            break;
        }

        return null;
      },
      routes: {
        '/': (_) => MainPage(),
      },
    );
  }
}
