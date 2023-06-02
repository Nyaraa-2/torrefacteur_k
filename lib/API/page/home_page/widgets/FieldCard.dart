import 'package:flutter/material.dart';
import 'package:torrefacteur_k/API/page/field_page/FieldPage.dart';

import '../../../entities/Champ.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({Key? key, required this.champ, required this.idJoueur}) : super(key: key);
  static const String stardew = "assets/images/stardew.png";
  final Champ champ;
  final String idJoueur;
  static const String plant = "Nombre de plants en cours : ";

  @override
  Widget build(BuildContext context) {
    Champ champSelected = champ;
    String plants = champ.plants.length.toString();
    return Card(
        elevation: 0,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        surfaceTintColor: Colors.white,
        child: InkWell(
            child: ListTile(
          leading: Image.asset(stardew),
          title: Text(champ.name),
          subtitle: Text(plant + plants),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FieldPage(champ: champSelected,idJoueur: idJoueur),
              )),
        )));
  }
}
