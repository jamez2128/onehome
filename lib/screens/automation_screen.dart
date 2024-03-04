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
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text("Automation 1"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AutomationConfiguration(),
                  ),
                );
              },
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
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddAutomation(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}

class AddAutomation extends StatelessWidget {
  const AddAutomation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add Automation"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
            child: const Text("Save"),
          ),
        ],
      ),
      body: Column(
        children: <Widget> [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Label",
                prefixIcon: Icon(Icons.label),
              ),
              onChanged: (String value) {},
            ),
          ),
          ListTile(title: const Text("Repeat: Everyday"), onTap: () {},),
          ListTile(leading: const Icon(Icons.access_time), title: const Text("Time: 6:00 am"), onTap: () {},),
          const PowerSwitch(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Brightness"),
                Slider(value: 0, onChanged: (double value) {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AutomationConfiguration extends StatelessWidget {
  const AutomationConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Automation Configuration"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
            child: const Text("Save"),
          ),
        ],
      ),
      body: Column(
        children: <Widget> [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Label",
                prefixIcon: Icon(Icons.label),
              ),
              onChanged: (String value) {},
            ),
          ),
          ListTile(title: const Text("Repeat: Everyday"), onTap: () {},),
          ListTile(leading: const Icon(Icons.access_time), title: const Text("Time: 6:00 am"), onTap: () {},),
          const PowerSwitch(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Brightness"),
                Slider(value: 0, onChanged: (double value) {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PowerSwitch extends StatefulWidget {
  const PowerSwitch({super.key});

  @override
  State<PowerSwitch> createState() => _PowerSwitchState();
}

class _PowerSwitchState extends State<PowerSwitch> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: state,
      onChanged: (bool value) {
        setState(() {
          state = value;
        });
      },
      title: const Text("Power"),
    );
  }
}