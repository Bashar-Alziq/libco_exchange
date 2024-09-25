class Company {
  int id;
  String name;
  String logo;
  Company({required this.id, required this.name, required this.logo});

  factory Company.fromJson(Map<String, dynamic> data) {
    return Company(id: data["id"], name: data["name"], logo: data["logo"]);
  }
}
