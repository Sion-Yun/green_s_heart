import 'dart:convert';

import 'package:flutter/services.dart';

import 'medication.dart';

class MedicationManager {
  MedicationManager();

  void addMedication(Medication med) {}

  void removeMedication(String id) {}

  void updateMedication(String id) {}

  static Future<List<Medication>> getAllMedications() async {
    List<Medication> medicationList = [];
    final String response =
    await rootBundle.loadString('data/medications.json');
    final data = await json.decode(response);

    for (int i = 0; i < data.length; i++) {
      medicationList.add(Medication.fromJson(data[i]));
    }

    return medicationList;
  }
}
