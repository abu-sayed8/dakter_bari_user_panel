class PatientDetailsModel{
  String id;
  String fullName;
  String phone;
  String password;
  String email;
  String joinDate;
  String gender;
  String country;
  String state;
  String city;
  String currency;
  String imageUrl;
  String age;
  String problem;
  String address;
  String bloodGroup;
  String totalTakenService;
  String countryCode;
  bool takenTeleService;

  PatientDetailsModel({
    this.id,
    this.fullName,
    this.phone,
    this.password,
    this.email,
    this.joinDate,
    this.gender,
    this.country,
    this.state,
    this.city,
    this.currency,
    this.imageUrl,
    this.address,
    this.bloodGroup,
    this.totalTakenService,
    this.countryCode,
    this.takenTeleService,
});
}