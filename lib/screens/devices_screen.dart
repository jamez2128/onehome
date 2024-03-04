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
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text("Living Room Lights"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DeviceConfiguration(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text("Living Room TV"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text("Kitchen Lights"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.speaker),
            title: const Text("Dining Room Speakers"),
            onTap: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Device",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDevice(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddDevice extends StatelessWidget {
  const AddDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add Device"),
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
                  labelText: "Label",
                  prefixIcon: Icon(Icons.label),
                  border: UnderlineInputBorder()
              ),
              onChanged: (String value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.numbers),
                labelText: "Pair Code",
                border: const UnderlineInputBorder(),
                suffixIcon: IconButton(icon: const Icon(Icons.qr_code_scanner), onPressed: () { },)
              ),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
    );
  }
}


class DeviceConfiguration extends StatelessWidget {
  const DeviceConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Device Configuration"),
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