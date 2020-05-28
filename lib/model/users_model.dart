class UsersModle {
  String name;
  String lastName;
  String mobile;
  String nationalCode;
  String birthDate;

  UsersModle({
    this.name,
    this.lastName,
    this.mobile,
    this.nationalCode,
    this.birthDate,
  });

  factory UsersModle.fromJson(Map<String, dynamic> json) {
    return UsersModle(
        name: json['name'],
        lastName: json['lastName'],
        mobile: json['mobile'],
        birthDate: json['birthDate'],
        nationalCode: json['nationalCode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['LastName'] = this.lastName;
    data['Mobile'] = this.mobile;
    data['BirthDate'] = this.birthDate;
    data['NationalCode'] = this.nationalCode;
    return data;
  }
}
