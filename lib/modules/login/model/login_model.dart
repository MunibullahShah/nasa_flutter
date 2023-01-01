class LoginModel {
  String? username;
  String? email;
  String? password;

  LoginModel({this.username, this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
