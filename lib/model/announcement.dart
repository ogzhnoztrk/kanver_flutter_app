class Announcement {
  final int id;
  final String fullName;

  final int bloodTypeId;
  final int cityId;

  final int urgency;

  final String phoneNumber;
  final String explanation;

  Announcement(this.id, this.fullName, this.bloodTypeId, this.cityId,
      this.urgency, this.phoneNumber, this.explanation);
}
