import 'Plant.dart';

class Champ {
  String id;
  String name;
  String specification;
  List<Plant> plants;

  Champ({required this.id,
    required this.name,
    required this.specification,
    required this.plants});

  factory Champ.fromJson(Map<String, dynamic> json) {
    return Champ(
        id: json["id"],
        name: json["name"],
        specification: json["specifiation"],
        plants: json["plants"] == null ?
        <Plant>[]
            : List<Plant>.from(json["plants"].map((c) => Plant.fromJson(c)))
    );
  }
}
