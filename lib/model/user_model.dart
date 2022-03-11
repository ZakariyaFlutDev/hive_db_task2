class User{
  String name = "";
  String password = "";

  User.from({required this.name, required this.password});

  User.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      password = json["password"];

  Map<String, dynamic> toJson() => {
    "name" : name,
    "password" : password,
  };
}