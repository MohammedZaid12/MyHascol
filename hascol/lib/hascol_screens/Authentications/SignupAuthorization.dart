
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
  final String name;
  final String username;
  final String location;
  final String locationArea;
  final String phoneNumber;
  final int roleId;
  final String nic;
  final String roleName;
  final String auth;

  SignUpAuth(
      {this.userId,
      this.name,
      this.username,
      this.location,
      this.locationArea,
      this.phoneNumber,
      this.roleId,
      this.nic,
      this.roleName,
      this.auth});

  factory SignUpAuth.fromjson(Map<String, dynamic> json) {
    var temp = SignUpAuth(
      userId: getInt(json["user_id"]),
      name: getString(json["name"]),
      username: getString(json["username"]),
      location: getString(json["location"]),
      locationArea: getString(json["location_area"]),
      phoneNumber: getString(json["phone_number"]),
      roleId: getInt(json["role_id"]),
      nic: getString(json["nic"]),
      roleName: getString(json["role_name"]),
    );

    print(temp);
    return temp;

  }
}
