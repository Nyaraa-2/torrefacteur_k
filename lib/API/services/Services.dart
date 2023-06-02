import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import '../entities/Data.dart';
import '../entities/Joueur.dart';
import '../entities/Kafe.dart';
import '../entities/Plant.dart';

Future<Joueur> getJoueur() async {
  var response = await FirebaseDatabase.instance
      .ref()
      .child('/joueurs/27345424-ff1f-11ed-be56-0242ac120002')
      .get();
  var decode = jsonEncode(response.value);
  print(decode);
  return Joueur.fromJson(json.decode(decode));
}

void addPlantInDatabase(String idJoueur,String idChamp, Plant plant) async {
  String id = plant.id;
  FirebaseDatabase.instance.ref().child('/joueurs/$idJoueur/Champs/$idChamp/plants/$id').set(plant.toJson());
}

Future<List<Kafe>> getKafes() async {
  var response = await FirebaseDatabase.instance.ref().child("/kafes").get();
  var decode = jsonEncode(response.value);
  return List<Kafe>.from(json.decode(decode).map((p) => Kafe.fromJson(p)));
}

void setRecolte(Kafe kafe, String idJoueur) async {
  var response =  await FirebaseDatabase.instance.ref().child('/joueurs/$idJoueur/Recoltes/${kafe.id}').get();
  var decode = jsonEncode(response.value);
  Data d = Data.fromJson(json.decode(decode));
  d.jauge = d.jauge + kafe.production;
  FirebaseDatabase.instance.ref().child('/joueurs/$idJoueur/Recoltes/${kafe.id}/jauge').set(d.jauge);
}

void deletePlant(String idPlant,String idJoueur,String idChamp) {
  DatabaseReference plantRef = FirebaseDatabase.instance.ref().child('/joueurs/$idJoueur/Champs/$idChamp/plants/$idPlant');
  plantRef.remove()
      .then((_) => print('Plant supprimé avec succès'))
      .catchError((error) => print('Erreur lors de la suppression du plant : $error'));
}


