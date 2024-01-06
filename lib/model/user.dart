class User {
  String? id;
  String name;
  String email;
  String phone;
  String? password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.password
});

factory User.fromJson(Map<String, dynamic> json) => User(
  id : json['id'],
  name: json['name'], 
  email: json['email'], 
  phone: json['phone'],
  password: json['password']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
  };
}