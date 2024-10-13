import 'package:flutter/material.dart';
import 'model/medication.dart';
import 'model/medicationManager.dart';

// Homepage widget is the main screen of this application
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // Creates the state of homepage
  State<HomePage> createState() => _HomePageState();
}

// State class of homepage
class _HomePageState extends State<HomePage> {
  List<Medication> medicationList = [];  // List of medication data

  @override
  void initState() {
    super.initState();  // Calls the init state of the parent
    getInitData();  // Fetches the init data
  }

  // Async to get the complete init data from the MedicationManager
  getInitData() async {
    // To get all medications from the pre-defined json file
    medicationList = await MedicationManager.getAllMedications();

    // To update the state and reflect the fetched medications
    setState(() {});
  }

  // HomePage's UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating action button placeholder for adding new medications
      // floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView.builder(
          itemCount: medicationList.length,  // Number of items in the list
          itemBuilder: (context, idx) {
            return Card(
              // TODO - change to TableView to show the field names
              child: ListTile(
                leading: Icon(Icons.medication),
                // Displays medication id
                title: Text(medicationList[idx].id ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displays medication details
                    Text(medicationList[idx].name ?? ""),
                    Text(medicationList[idx].time ?? ""),
                    Text(medicationList[idx].dose ?? ""),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
