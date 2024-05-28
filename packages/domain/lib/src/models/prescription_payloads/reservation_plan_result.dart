import '../../../domain.dart';

class ReservationPlanResult {
  final List<ReservationPlanEntry> entries;
  final Map<int, int> reservationQuantities;

  const ReservationPlanResult({
    required this.entries,
    required this.reservationQuantities,
  });
}
