class BabyNameModel {
  int id;
  String name;
  String? name2;
  String nameMeaning;
  String? nameMeaning2;
  String religion;
  int babyType;
  String? twinType;
  bool isFavourite;

  BabyNameModel({
    required this.id,
    required this.name,
    this.name2,
    required this.nameMeaning,
    this.nameMeaning2,
    required this.religion,
    required this.babyType,
    this.twinType,
    this.isFavourite = false,
  });
}
