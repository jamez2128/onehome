import 'package:flutter/material.dart';
import 'screens/devices_screen.dart';
import 'screens/automation_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneHome',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6324EA),
            brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/logo.jpg',
        nextScreen: const DevicesScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String _appBarTitle = "Devices";
int _selectedIndex = 0;
Widget _currentPage = const DevicesScreen();

class _HomePageState extends State<HomePage> {
  void _changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentPage = const DevicesScreen();
          _appBarTitle = "Devices";
          break;
        case 1:
          _currentPage = const AutomationScreen();
          _appBarTitle = "Automation";
      }
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.devices),
              selected: _selectedIndex == 0,
              title: const Text("Devices"),
              onTap: (() {
                _changeScreen(0);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              selected: _selectedIndex == 1,
              title: const Text("Automation"),
              onTap: (() {
                _changeScreen(1);
              }),
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}