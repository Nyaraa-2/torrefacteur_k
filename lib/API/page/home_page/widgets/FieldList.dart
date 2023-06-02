import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteur_k/API/entities/Joueur.dart';

import '../../../entities/Champ.dart';
import 'FieldCard.dart';

class FieldList extends StatelessWidget {
  const FieldList({Key? key, required this.joueur}) : super(key: key);
  final Joueur joueur;

  @override
  Widget build(BuildContext context) {
    Joueur j = joueur;
    return Expanded(
      child: ListView.separated(
        itemCount: j.champs.length,
        itemBuilder: (context, index) {
          Champ current = j.champs[index];
          return FieldCard(champ: current,idJoueur: joueur.id,);
        }, separatorBuilder: (BuildContext context, int index) {
        return const Divider(indent: 10,);
      },),
    );
  }
}
