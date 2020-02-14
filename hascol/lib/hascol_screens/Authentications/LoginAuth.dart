
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

class LoginAuthorization {
  final int userId;
  final String name;
  final String username;
  final String location;
  final String locationArea;
  final int phoneNumber;
  final int roleId;
  final int nic;
  final String roleName;
  final String auth;

  LoginAuthorization(
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

  factory LoginAuthorization.fromjson(Map<String, dynamic> json) {
    var temp = LoginAuthorization(
      userId: getInt(json["user_id"]),
      name: getString(json["name"]),
      username: getString(json["username"]),
      location:  getString(json["location"]),
      locationArea: getString(json["location_area"]),
      phoneNumber: getInt(json["phone_number"]),
      roleId: getInt(json["role_id"]),
      nic: getInt(json["nic"]),
      roleName: getString(json["role_name"]),
      auth: getString(json["auth"]),
    );
    print(temp);
    return temp;
  }
//  Map toMap() {
//    var map = new Map<String, dynamic>();
//    map["data.user_id"] = user_id;
//    map["data.name"] = name;
//    map["data.username"] = username;
//    map["data.location"] = location;
//    map["data.location_area"] = location_area;
//    map["data.phone_number"] = phone_number;
//    map["data.role_id"] = role_id;
//    map["data.nic"] = nic;
//    map["data.role_name"] = role_name;
//    map["data.auth"] = auth;
//
//    return map;
//  }

}
