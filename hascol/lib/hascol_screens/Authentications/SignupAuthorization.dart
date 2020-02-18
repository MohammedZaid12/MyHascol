
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
  final int phoneNumber;
  final int roleId;
  final int nic;
  final String roleName;
  final String auth;
  final int jdeCode;

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
      this.auth ,
        this.jdeCode});

  factory SignUpAuth.fromjson(Map<String, dynamic> json) {
    var temp = SignUpAuth(
      userId: getInt(json["user_id"]),
      email: getString(json["email"]),
      username: getString(json["username"]),
      password: getString(json["password"]),
      locationArea: getString(json["location_area"]),
      phoneNumber: getInt(json["phone_number"]),
      roleId: getInt(json["role_id"]),
      nic: getInt(json["nic"]),
      roleName: getString(json["role_name"]),
      jdeCode: getInt(json["jdeCode"]),

    );
  }

    Map toMap() {
      var map = new Map<String, dynamic>();
      map["userId"] = userId;
      map["username"] = username;
      map["password"] = password;
      map["locationArea"] = locationArea;
      map["phoneNumber"] = phoneNumber;
      map["email"] = email;
      map["nic"] = nic;
      map["roleName"] = roleName;
      map["jdeCode"] = jdeCode;


      return map;
    }



}
