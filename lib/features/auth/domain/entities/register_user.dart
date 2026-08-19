class RegisterUser {
  final String fullName; // مطابق لـ full_name في الباك-إند
  final String email;
  final String phone;
  final String location;
  final String role;
  final String password;
  final String passwordConfirmation;
  final String profileImagePath; // لمسار الصورة من الهاتف
  final String? token;

  RegisterUser({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.location,
    required this.role,
    required this.password,
    required this.passwordConfirmation,
    required this.profileImagePath,
    this.token,
  });
}