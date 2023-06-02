import 'package:torrefacteur_k/API/entities/Kafe.dart';

class Plant {
  String id;
  int temps;
  Kafe? kafe;

  Plant({required this.id, required this.temps, required this.kafe});
  factory Plant.fromAnotherSource(String id) {
    return Plant(id: id,kafe: null,temps: 0);
  }

  factory Plant.fromJson(Map<String, dynamic> json){
    return Plant(
      id : json["id"],
        temps: json["temps"],
        kafe: Kafe.fromJson(json["Kafé"]));
  }

  Map<String, dynamic> toJson() => {
    'temps': temps,
    'id': id,
    'Kafé': kafe?.toJson(),
  };
}
