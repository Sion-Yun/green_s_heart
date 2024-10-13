import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:greens_heart/model/prescriptionMedication.dart';
import 'medication.dart';

// Class to handle medication related operations, provides encapsulation
class MedicationManager {
  List<Medication> _medicationList = [];  // List of medications

  MedicationManager();  // Constructor

  // Adds a  medication to the list
  void addMedication(Medication med) {
    _medicationList.add(med);
    saveMedications(_medicationList);  // Saves the changes to JSON
  }

  // Removes a medication from the list
  void removeMedication(String id) {
    _medicationList.removeWhere((med) => med.id == id);
    saveMedications(_medicationList);  // Saves the changes to JSON
  }

  // Updates a medication from the list with a new medication as input
  void updateMedication(String id, Medication updatedMed) {
    for (int i = 0; i < _medicationList.length; i++) {
      if (_medicationList[i].id == id) {
        _medicationList[i] = updatedMed;  // Update medication details
        break;  // Exit the loop
      }
    }
    saveMedications(_medicationList);  // Saves the changes to JSON
  }

  // To save the current/modified medications to JSON file
  static Future<void> saveMedications(List<Medication> medicationList) async {
    List<Map<String, dynamic>> jsonMedList = [];  // List of medication maps

    // Maps each medication objects
    for (var medication in medicationList) {
      Map <String, dynamic> medicationMap = {
        'id': medication.id,
        'name': medication.name,
        'time': medication.time,
        'dose': medication.dose,
      };

      // If the medication is prescribed medication, add doctor's name
      if (medication is PrescriptionMedication) {
        medicationMap['doctorName'] = medication.doctorName;
      }

      // Add the medication map to the list
      jsonMedList.add(medicationMap);
    }

    // Convert the list to a JSON string
    final String jsonString = jsonEncode(jsonMedList);
    final jsonFile = File('data/medications.json');  // JSON file path
    await jsonFile.writeAsString(jsonString);  // Write JSON string to the file
  }

  // Static method to get all medications from the JSON file
  // Async to obtain all medications
  static Future<List<Medication>> getAllMedications() async {
    List<Medication> medicationList = [];  // List of retrieved medications
    // Load JSON string from the path
    final String response = await rootBundle.loadString('data/medications.json');
    final data = await json.decode(response);  // Decode the JSON data

    // Converts JSON objects to Medication or PrescriptionMedication object
    for (var jsonMed in data) {
      if (jsonMed.containsKey('doctorName')) {
        medicationList.add(PrescriptionMedication.fromJson(jsonMed));
      }
      else {
        medicationList.add(Medication.fromJson(jsonMed));
      }
    }
    return medicationList;  // Return the list of all medications
  }
}


