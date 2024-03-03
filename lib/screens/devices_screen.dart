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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DeviceConfiguration(),
                ),
              );
            },
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
    var _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add Device"),
        actions: [
          MaterialButton(
            onPressed: () {},
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
                  border: OutlineInputBorder()
              ),
              onChanged: (String value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Pair Code",
                border: UnderlineInputBorder(),
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
            onPressed: () {},
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
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
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