class LoginModel {
  String? nisp;
  String? password;
  int? roleId;

  LoginModel({this.nisp, this.password, this.roleId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    nisp = json['nisp'];
    password = json['password'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nisp'] = this.nisp;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    return data;
  }
}