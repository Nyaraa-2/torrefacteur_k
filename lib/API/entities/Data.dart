import '../../../tools/EnumKafe.dart';

class Data {
  double jauge;
  String nom;

  Data({required this.nom, required this.jauge});

  factory Data.fromAnotherSource() {
    return Data(nom: "", jauge: 0);
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(jauge: json["jauge"], nom: json["nom"]);
  }

  Map<String, dynamic> toJson() => {
    'jauge': jauge,
  };
}
