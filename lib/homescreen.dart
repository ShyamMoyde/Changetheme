import 'package:api_integration/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: SwitchListTile(
                title: Text("Theme"),
            secondary: Icon(themeState.getDarkTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onChanged: (bool value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
            value: themeState.getDarkTheme,
          )),
        ),
      ),
    );
  }
}
