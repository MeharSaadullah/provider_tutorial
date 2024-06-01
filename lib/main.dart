import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/Auth_provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';
import 'package:provider_tutorial/provider/example_one_provider.dart';
import 'package:provider_tutorial/provider/favourite_provider..dart';
import 'package:provider_tutorial/provider/theme_changer_provider.dart';
//import 'package:provider_tutorial/screen/count_screen.dart';
import 'package:provider_tutorial/screen/dark_theme.dart';
import 'package:provider_tutorial/screen/loginscreen.dart';

//import 'package:provider_tutorial/screen/example_one.dart';
//import 'package:provider_tutorial/screen/favourite/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themechanger = Provider.of<ThemeChanger>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteIteamProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: Colors.black12),
                brightness: Brightness.light,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  appBarTheme: AppBarTheme(backgroundColor: Colors.teal)),
              home: LogInScreen());
        }));
  }
}
