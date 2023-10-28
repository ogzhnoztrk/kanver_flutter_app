class Donor {
  final int id;
  final int applicationUserId;
  final int cityId;

  final bool disesaseStatus;
  final bool drugStatus;
  final bool alcholStatus;
  final bool medicationStatus;

  Donor(
    this.id,
    this.applicationUserId,
    this.cityId,
    this.disesaseStatus,
    this.drugStatus,
    this.alcholStatus,
    this.medicationStatus,
  );
}
