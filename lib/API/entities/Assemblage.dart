import 'Gato.dart';

class Assemblage {
  Gato gato;
  double poids;
  Assemblage({required this.gato, required this.poids});

  factory Assemblage.fromJson(Map<String,dynamic> json){
    return Assemblage(gato: Gato.fromJson(json["gato"]), poids: json["poids"]);
  }
}