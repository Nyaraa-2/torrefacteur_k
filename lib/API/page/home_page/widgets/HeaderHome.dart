import 'package:flutter/material.dart';

import '../../../entities/Data.dart';
import '../../../entities/Joueur.dart';
import '../../assemblies_pages/AssemblyResume.dart';
import '../../gattering_page/Gattering.dart';
import '../../product_page/Product.dart';
import 'ShortCut.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.joueur}) : super(key: key);
  final Joueur joueur;
  static const String harvest = "Récoltes";
  static const String produce = "Production";
  static const String assemblies = "Assemblages";
  static const String assetHarvest = "assets/images/NaturalFood.png";
  static const String assetProduce = "assets/images/Irrigation.png";
  static const String assetAssemblies = "assets/images/Cached.png";

  @override
  Widget build(BuildContext context) {
    Joueur j = joueur;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShortCut(
            image: assetHarvest,
            text: harvest,
            routing: GatteringPage(joueur: j),
            idJoueur: "id"),
        ShortCut(
            image: assetProduce,
            text: produce,
            routing: ProductPage(joueur: j),
            idJoueur: "id"),
        ShortCut(
            image: assetAssemblies,
            text: assemblies,
            routing: AssemblyResumePage(joueur: j),
            idJoueur: "id"),
      ],
    );
  }
}

class GapBox extends StatelessWidget {
  const GapBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * .03,
        height: MediaQuery
            .of(context)
            .size
            .height * .03);
  }
}
