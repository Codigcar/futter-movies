import 'package:flutter/material.dart';
import 'package:peliculas/provider/movies_provider.dart';

import 'package:peliculas/screens/index.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());
// void main() => runApp(const MyApp());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.indigo),
      ),
    );
  }
}
