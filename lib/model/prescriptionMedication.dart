import 'medication.dart';
import 'medicationManager.dart';

class PrescriptionMedication extends Medication {
  PrescriptionMedication(id, name, time, dose) : super('id', 'name', 'time', 'dose');
  MedicationManager? manager;
// TODO - Create at least one subclass of ‘Medication’ (e.g., ‘PrescriptionMedication’) that adds
// additional properties or methods.
}