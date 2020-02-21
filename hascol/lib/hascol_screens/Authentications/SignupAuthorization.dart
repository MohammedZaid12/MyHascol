

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

  final String userId;
  final int id;
  final String email;
  final String username;
  final String password;
  final String locationArea;
  final String phoneNumber;
  final String roleId;
  final String cnic;
  final String roleName;
  final String regionsId;
  final String jdeCode;

  SignUpAuth(
      {this.userId,
      this.email,
      this.username,
      this.password,
      this.locationArea,
      this.phoneNumber,
      this.roleId,
      this.cnic,
      this.roleName,
      this.regionsId,
      this.id,
      this.jdeCode});

  factory SignUpAuth.fromjson(Map<String, dynamic> json) {
    return SignUpAuth(
      userId: getString(json["user_id"]),
      email: getString(json["email"]),
      username: getString(json["username"]),
      password: getString(json["password"]),
      locationArea: getString(json["location_area"]),
      phoneNumber: getString(json["phone_number"]),
      roleId: getString(json["role_id"]),
      cnic: getString(json["nic"]),
      roleName: getString(json["role_name"]),
      jdeCode: getString(json["jde_code"]),
      regionsId: getString(json["location"]),

    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['userId'] = userId;
    map["username"] = username;
    map["password"] = password;
    map["email"] = email;
    map["phone_number"] = phoneNumber;
    map["jde_code"] = jdeCode;
    map["nic"] = cnic;
    map["role_id"] = roleId;
    map["location"] = regionsId;


    return map;
  }
}
