import 'package:flutter/material.dart';
import 'model/medication.dart';
import 'model/medicationManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Medication> medicationList = [];

  @override
  void initState() {
    super.initState();
    getInitData();
  }

  getInitData() async {
    // To get all medications from the pre-defined json file
    medicationList = await MedicationManager.getAllMedications();

    // To update the state again
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Is a placeholder for the 'add' button
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView.builder(
          itemCount: medicationList.length,
          itemBuilder: (context, idx) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.medication),
                title: Text(medicationList[idx].id ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
