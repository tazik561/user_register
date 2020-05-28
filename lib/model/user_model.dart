class UserModle {
  String userName;
  String password;

  UserModle({
    this.userName,
    this.password,
  });

  factory UserModle.fromJson(Map<String, dynamic> json) {
    return UserModle(userName: json['userName'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName.trim();
    data['Password'] = this.password;
    return data;
  }
}
