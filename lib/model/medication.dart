import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greens_heart/model/medicationManager.dart';

class Medication implements MedicationManager {
  final String? id;
  final String? name;
  final String? time;
  final String? dose;
  Medication(this.id, this.name, this.time, this.dose);

  factory Medication.fromJson(dynamic json) {
    return Medication(json['id'] as String, json['name'] as String,
        json['time'] as String, json['dose'] as String);
  }

  @override
  void addMedication(Medication med) {
    // TODO: implement addMedication
  }

  @override
  Future<List<Medication>> getAllMedications() async {
    List<Medication> ret = [];
    final String response =
    await rootBundle.loadString('../data/medications.json');
    final data = await json.decode(response);

    for (int i = 0; i < data.length; i++) {
      ret.add(Medication.fromJson(data[i]));
    }

    return ret;
  }

  @override
  void removeMedication(String id) {
    // TODO: implement removeMedication
  }

  @override
  void updateMedication(String id) {
    // TODO: implement updateMedication
  }
}
