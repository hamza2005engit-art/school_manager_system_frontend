class User {
  final int id;
  final String name;
  final String email;
  final String? token;
  final String? role;
  final List? material;
  final String? materialId;
  final List? section;
  final List? stage_number;
  final int salary;
  User(
    this.material,
    this.materialId,
    this.section,
    this.stage_number,
    this.salary, {
    required this.id,
    required this.name,
    required this.email,
    this.token,
    this.role,
  });
}
