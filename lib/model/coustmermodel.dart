class CoustomerModel {
  String? email;
  String? username;
  String? firstname;
  String? lastname;
  String? password;

  CoustomerModel(
      {this.email,
      this.username,
      this.firstname,
      this.lastname,
      this.password});

  CoustomerModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstname;
    data['last_name'] = this.lastname;
    data['password'] = this.password;
    return data;
  }
}