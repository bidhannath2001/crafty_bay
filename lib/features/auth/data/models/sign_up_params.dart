class SignUpParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final String city;

  SignUpParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'city': city,
    };
  }

}