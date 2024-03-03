import 'package:flutter/material.dart';
import '../components/sidenavbar.dart';

class AutomationScreen extends StatefulWidget {
  const AutomationScreen({super.key});

  @override
  State<AutomationScreen> createState() => _AutomationScreenState();
}

class _AutomationScreenState extends State<AutomationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideNavBar(
          selectedIndex: 1,
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Automation"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ],
        ),
        body: ListView(
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
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Add Automation",
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
