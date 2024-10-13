import 'package:greens_heart/model/medicationManager.dart';

class Medication implements MedicationManager {
  final String? id;
  final String? name;
  final String? time;
  final String? dose;

  Medication(this.id, this.name, this.time, this.dose);

  factory Medication.fromJson(dynamic json) {
    return Medication(
        json['id'] as String,
        json['name'] as String,
        json['time'] as String,
        json['dose'] as String
    );
  }

  @override
  void addMedication(Medication med) {}

  @override
  void removeMedication(String id) {}

  @override
  void updateMedication(String id, Medication updatedMed) {}
}
