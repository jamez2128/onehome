import 'package:flutter/material.dart';
import '../components/sidenavbar.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavBar(
        selectedIndex: 0,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Devices"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: ListView(
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
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Device",
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
