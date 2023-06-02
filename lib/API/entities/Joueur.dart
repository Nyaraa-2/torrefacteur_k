import 'package:torrefacteur_k/API/entities/Exploitation.dart';

import 'Assemblage.dart';
import 'Champ.dart';
import 'Data.dart';

class Joueur {
  String id;
  String avatar;
  String mail;
  String nom;
  String prenom;
  String pseudo;
  Assemblage assemblage;
  List<Data> production;
  List<Data> recoltes;
  List<Champ> champs;

  Joueur(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.mail,
      required this.pseudo,
      required this.avatar,
      required this.assemblage,
      required this.production,
      required this.recoltes,
      required this.champs});

  factory Joueur.fromJson(Map<String, dynamic> json) {
    return Joueur(
        id: json["id"],
        avatar: json["avatar"],
        mail: json["mail"],
        nom: json["nom"],
        prenom: json["prenom"],
        pseudo: json["pseudo"],
        assemblage: Assemblage.fromJson(json["Assemblage"]),
        production: List<Data>.from(json["Productions"].map((p) => Data.fromJson(p))),
        recoltes: List<Data>.from(json["Recoltes"].map((r) => Data.fromJson(r))),
        champs: [...json["Champs"].values.map((c) => Champ.fromJson(c))]);
  }
}
