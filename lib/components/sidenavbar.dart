import 'package:flutter/material.dart';
import '../screens/devices_screen.dart';
import '../screens/automation_screen.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Devices"),
            selected: selectedIndex == 0,
            onTap: (() {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const DevicesScreen(),
                ),
              );
            }),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            selected: selectedIndex == 1,
            title: const Text("Automation"),
            onTap: (() {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AutomationScreen(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
