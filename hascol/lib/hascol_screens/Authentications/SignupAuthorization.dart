
int getInt(dynamic number) {
  if (number != null) {
    return ((number is String)) ? (int.tryParse(number) ?? 0) : number;
  }
  return 0;
}

double getDouble(dynamic number) {
  return (number == null) ? 0.0 : number.toDouble();
}

String getString(dynamic string) {
  return (string != null) ? string.toString() : "";
}

class SignUpAuth {
  final int userId;
  final String email;
  final String username;
  final String password;
  final String locationArea;
  final String phoneNumber;
  final int roleId;
  final String nic;
  final String roleName;
  final String auth;

  SignUpAuth(
      {this.userId,
      this.email,
      this.username,
      this.password,
      this.locationArea,
      this.phoneNumber,
      this.roleId,
      this.nic,
      this.roleName,
      this.auth});

  factory SignUpAuth.fromjson(Map<String, dynamic> json) {
    var temp = SignUpAuth(
      userId: getInt(json["user_id"]),
      email: getString(json["name"]),
      username: getString(json["username"]),
      password: getString(json["password"]),
      locationArea: getString(json["password_area"]),
      phoneNumber: getString(json["phone_number"]),
      roleId: getInt(json["role_id"]),
      nic: getString(json["nic"]),
      roleName: getString(json["role_name"]),
    );

    print(temp);
    return temp;

  }
}
