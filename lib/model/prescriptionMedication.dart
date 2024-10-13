import 'medication.dart';

class PrescriptionMedication extends Medication {
  final String doctorName;

  PrescriptionMedication(id, name, time, dose, this.doctorName)
      : super('id', 'name', 'time', 'dose');

  factory PrescriptionMedication.fromJson(dynamic json) {
    return PrescriptionMedication(
        json['id'] as String,
        json['name'] as String,
        json['time'] as String,
        json['dose'] as String,
        json['doctorName'] as String
    );
  }
}