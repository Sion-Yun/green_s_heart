import 'package:greens_heart/model/medicationManager.dart';

// Class represents Medications, implements MedicationManager
class Medication implements MedicationManager {
  final String? id;  // Identifier for medication
  final String? name;  // Name of medication
  final String? time;  // Time - When the medication is taken
  final String? dose;  // Dosage of medication

  // Constructor
  Medication(this.id, this.name, this.time, this.dose);

  // Factory constructor to get Medication instances from JSON object
  factory Medication.fromJson(dynamic json) {
    return Medication(
        // Extract followings from JSON
        json['id'] as String,
        json['name'] as String,
        json['time'] as String,
        json['dose'] as String
    );
  }

  // Methods from MedicationManager to be implemented (if applicable)
  @override
  void addMedication(Medication med) {}

  @override
  void removeMedication(String id) {}

  @override
  void updateMedication(String id, Medication updatedMed) {}
}
