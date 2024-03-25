import 'package:flutter/material.dart';
import '../components/sidenavbar.dart';
import '../database/db_automation.dart';
import '../database/dataAutomation.dart';
import 'package:uuid/uuid.dart';

class AutomationScreen extends StatefulWidget {
  const AutomationScreen({Key? key}) : super(key: key);

  @override
  State<AutomationScreen> createState() => _AutomationScreenState();
}

class _AutomationScreenState extends State<AutomationScreen> {
  final dbService = DatabaseService();
  final labelController = TextEditingController();
  final featureController = TextEditingController();

  // Add tally
  void addAutomation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditAutomationScreen(
            label: 'Add Automation',
            onPressed: (label, feature) {
              var automation = dataAutomation(
                id: const Uuid().v4(),
                label: label,
                feature: feature,
              );
              dbService.insertAutomation(automation);
              setState(() {});
              Navigator.pop(context);
            }),
      ),
    );
  }

  // Edit tally
  void editAutomation(dataAutomation automation) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditAutomationScreen(
          label: 'Update Automation',
          onPressed: (label, feature) {
            var updatedAutomation = dataAutomation(
              id: automation.id,
              label: label,
              feature: feature,
            );
            dbService.editAutomation(updatedAutomation);
            setState(() {});
            Navigator.pop(context);
          },
          initialLabel: automation.label,
          initialFeature: automation.feature,
        ),
      ),
    );
  }

  // Delete tally
  void deleteAutomation(String id) {
    dbService.deleteAutomation(id);
    setState(() {});
  }

  // Main Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavBar(
        selectedIndex: 1,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Automations'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: FutureBuilder<List<dataAutomation>>(
        future: dbService.getAutomations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Configurations found'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).colorScheme.inversePrimary,
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(
                      '${snapshot.data![index].label} ${snapshot.data![index].feature}'),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              editAutomation(snapshot.data![index]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              deleteAutomation(snapshot.data![index].id),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: Text('No Configurations found'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => addAutomation(),
      ),
    );
  }

  /*
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
  */
}

// Edit Screen
class AddEditAutomationScreen extends StatelessWidget {
  final String label;
  final String? initialLabel;
  final String? initialFeature;
  final Function(String label, String feature) onPressed;

  const AddEditAutomationScreen({
    Key? key,
    required this.label,
    required this.onPressed,
    this.initialLabel,
    this.initialFeature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelController = TextEditingController(text: initialLabel);
    final featureController =
        TextEditingController(text: initialFeature?.toString() ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: labelController,
              decoration: const InputDecoration(hintText: 'Label'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: featureController,
              decoration: const InputDecoration(hintText: 'Feature'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onPressed(labelController.text, featureController.text);
              },
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

/*
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
            shape:
                const CircleBorder(side: BorderSide(color: Colors.transparent)),
            child: const Text("Save"),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
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
          ListTile(
            title: const Text("Repeat: Everyday"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Time: 6:00 am"),
            onTap: () {},
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
            shape:
                const CircleBorder(side: BorderSide(color: Colors.transparent)),
            child: const Text("Save"),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
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
          ListTile(
            title: const Text("Repeat: Everyday"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Time: 6:00 am"),
            onTap: () {},
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
*/