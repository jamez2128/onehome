import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'OneHome',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6324EA)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class DevicesSection extends StatefulWidget {
  const DevicesSection({super.key});

  @override
  State<DevicesSection> createState() => _DevicesSectionState();
}

class _DevicesSectionState extends State<DevicesSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Device 1"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Device 2"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Device 3"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Device 4"),
          onTap: () {},
        ),
      ],
    );
  }
}

class AutomationSection extends StatefulWidget {
  const AutomationSection({super.key});

  @override
  State<AutomationSection> createState() => _AutomationSectionState();
}

class _AutomationSectionState extends State<AutomationSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Automation 1"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Automation 2"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Automation 3"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Automation 4"),
          onTap: () {},
        ),
      ],
    );;
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
String _appBarTitle = "Devices";
int _selectedIndex = 0;
Widget _currentPage = const DevicesSection();

class _HomePageState extends State<HomePage> {
  void _changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentPage = const DevicesSection();
          _appBarTitle = "Devices";
          break;
        case 1:
          _currentPage = const AutomationSection();
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
              onTap: (() { _changeScreen(0); }),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              selected: _selectedIndex == 1,
              title: const Text("Automation"),
              onTap: (() { _changeScreen(1); }),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_appBarTitle),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: _currentPage,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}