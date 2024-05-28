import '../../../domain.dart';
import 'test_use_case_helpers.dart';

class AddPrescriptionUseCase extends FutureUseCase<PrescriptionPlan, Prescription> {
  final MedicationRepository _medicationRepository;
  final PrescriptionRepository _prescriptionRepository;
  final PatientRepository _patientRepository;

  AddPrescriptionUseCase({
    required MedicationRepository medicationRepository,
    required PrescriptionRepository prescriptionRepository,
    required PatientRepository patientRepository,
  })  : _medicationRepository = medicationRepository,
        _prescriptionRepository = prescriptionRepository,
        _patientRepository = patientRepository;

  @override
  Future<Prescription> execute(PrescriptionPlan payload) async {
    final Map<int, List<PlainPrescriptionPlanEntry>> plainPlanEntries = processPlan(payload);

    final ReservationPlanResult? reservationPlan =
        await _medicationRepository.tryGetReservationPlan(
      medicationIds: payload.fixedPlans.map((FixedPrescriptionPlan e) => e.medicationId).toSet(),
      plainPlans: plainPlanEntries,
    );

    if (reservationPlan == null) {
      throw const ImpossiblePrescriptionException();
    }

    final Patient patient = await _patientRepository.getOrCreatePatient(
      name: payload.patientName,
    );

    await _medicationRepository.reserveStoredMedications(
      quantities: reservationPlan.reservationQuantities,
    );

    final Prescription prescription = await _prescriptionRepository.addPrescription(
      payloads: reservationPlan.entries,
      patientId: patient.id,
      comment: payload.comment,
    );

    return prescription;
  }
}
