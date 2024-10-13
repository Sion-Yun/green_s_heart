import 'medication.dart';

// Class of prescribed medications; inherits Medication class
class PrescriptionMedication extends Medication {
  final String doctorName;  // Doctor's name, additional property

  // Constructor passes parameters to its superclass, i.e. Medication
  PrescriptionMedication(id, name, time, dose, this.doctorName)
      : super('id', 'name', 'time', 'dose');  // Superclass constructor

  // Factory constructor to get PrescriptionMedication instances from JSON object
  factory PrescriptionMedication.fromJson(dynamic json) {
    return PrescriptionMedication(
      // Extract followings from JSON
        json['id'] as String,
        json['name'] as String,
        json['time'] as String,
        json['dose'] as String,
        json['doctorName'] as String
    );
  }
}