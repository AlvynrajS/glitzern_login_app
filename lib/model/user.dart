class User {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String userId;
  final String password;
  final String? image;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.userId,
    required this.password,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      userId: json['userId'],
      password: json['password'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'userId': userId,
      'password': password,
      'image': image,
    };
  }

  bool isValidCredentials(String providedUsername, String providedPassword) {
    return providedUsername == userId && providedPassword == password;
  }
}
