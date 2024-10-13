import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:greens_heart/model/prescriptionMedication.dart';
import 'medication.dart';

class MedicationManager {
  List<Medication> _medicationList = [];

  MedicationManager();

  void addMedication(Medication med) {
    _medicationList.add(med);
    saveMedications(_medicationList);
  }

  void removeMedication(String id) {
    _medicationList.removeWhere((med) => med.id == id);
    saveMedications(_medicationList);
  }

  void updateMedication(String id, Medication updatedMed) {
    for (int i = 0; i < _medicationList.length; i++) {
      if (_medicationList[i].id == id) {
        _medicationList[i] = updatedMed;
        break;
      }
    }
    saveMedications(_medicationList);
  }

  // To save the current/modified medications to JSON file
  static Future<void> saveMedications(List<Medication> medicationList) async {
    List<Map<String, dynamic>> jsonMedList = [];

    for (var medication in medicationList) {
      Map <String, dynamic> medicationMap = {
        'id': medication.id,
        'name': medication.name,
        'time': medication.time,
        'dose': medication.dose,
      };

      // if the medication is prescribed medication, add doctor's name
      if (medication is PrescriptionMedication) {
        medicationMap['doctorName'] = medication.doctorName;
      }

      jsonMedList.add(medicationMap);
    }

    final String jsonString = jsonEncode(jsonMedList);
    final jsonFile = File('data/medications.json');
    await jsonFile.writeAsString(jsonString);
  }

  static Future<List<Medication>> getAllMedications() async {
    List<Medication> medicationList = [];
    final String response = await rootBundle.loadString('data/medications.json');
    final data = await json.decode(response);

    for (var jsonMed in data) {
      if (jsonMed.containsKey('doctorName')) {
        medicationList.add(PrescriptionMedication.fromJson(jsonMed));
      }
      else {
        medicationList.add(Medication.fromJson(jsonMed));
      }
    }
    return medicationList;
  }
}


