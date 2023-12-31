import 'package:api_integration/homescreen.dart';
import 'package:api_integration/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'consts/theme_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async{
    themeChangeProvider.setDarkTheme= await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (context, themeProvider,child) {

            return MaterialApp(
              theme:  Styles.themeData(themeProvider.getDarkTheme, context),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          }
      ),
    );
  }
}
