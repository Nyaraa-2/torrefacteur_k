import 'package:flutter/material.dart';
import 'package:torrefacteur_k/API/page/home_page/widgets/BottomCustomNavigation.dart';
import 'package:torrefacteur_k/API/page/home_page/widgets/HeaderHome.dart';
import 'package:torrefacteur_k/tools/CustomAppBar.dart';

import '../../../tools/GlobalConstants.dart';
import '../../../tools/Style.dart';
import '../../entities/Champ.dart';
import '../../entities/Joueur.dart';
import 'Widgets/FieldWidget.dart';

class FieldPage extends StatelessWidget {
  const FieldPage({Key? key, required this.champ, required this.idJoueur}) : super(key: key);
  final Champ champ;
  final String idJoueur;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          Column(
            children: [
              const CustomAppBar(),
              const GapBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(GlobalConstants.logo),
                  const GapBox(),
                  FieldWidget(champ: champ),
                  const GapBox(),
                  BodyFieldPage(champ: champ, idJoueur: idJoueur,)
                ],
              ),
            ],
          ),
      ),
      bottomNavigationBar: Container(
        color: Style().secondary,
        child: const BottomCustomNavigation(),
      ),
    );
  }
}
