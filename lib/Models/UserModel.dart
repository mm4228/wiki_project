class User {
  final int? id;
  final String mail;
  final String password;

  const User({required this.id, required this.mail, required this.password});
  factory User.fromJson(Map<String,dynamic> json) => User(
      id: json['id'],
      mail: json['mail'],
      password: json['password']);


  Map<String, dynamic> toJson() => {
    'id': id,
    'mail':mail,
    'password':password
  };
}