class Donor {
  final int id;
  final int userId;
  final int cityId;

  final bool disesaseStatus;
  final bool drugStatus;
  final bool alcholStatus;
  final bool medicationStatus;

  Donor(
    this.id,
    this.userId,
    this.cityId,
    this.disesaseStatus,
    this.drugStatus,
    this.alcholStatus,
    this.medicationStatus,
  );
}
