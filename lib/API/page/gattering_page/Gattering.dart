import 'package:flutter/cupertino.dart';

import '../../entities/Joueur.dart';

class GatteringPage extends StatelessWidget {
  const GatteringPage({Key? key, required this.joueur}) : super(key: key);
  final Joueur joueur;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Gatering"),);
  }
}
