import 'Gato.dart';

class Kafe {
  int id;
  String nom;
  double production;
  String temps;
  int cout;
  Gato gato;

  Kafe({required this.id,
    required this.nom,
    required this.production,
    required this.temps,
    required this.cout,
    required this.gato});

  factory Kafe.fromJson(Map<String, dynamic> json) {
    return Kafe(
        id: json["id"],
        nom: json["nom"],
        production: json["production"],
        temps: json["temps"],
        cout: json["cout"],
        gato: Gato.fromJson(json["gato"]));
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom' : nom,
    'production' : production,
    'temps' : temps,
    'cout' : cout,
    'gato' : gato.toJson()
  };

}
