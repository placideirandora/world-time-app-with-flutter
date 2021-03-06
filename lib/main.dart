import 'package:flutter/material.dart';
import 'package:WorldTime/screens/home.dart';
import 'package:WorldTime/screens/choose_location.dart';
import 'package:WorldTime/screens/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
        '/location': (context) => ChooseLocationScreen()
      },
    ));
