import 'package:flutter/cupertino.dart';

import '../../entities/Joueur.dart';

class AssemblyResumePage extends StatelessWidget {
  const AssemblyResumePage({Key? key, required this.joueur}) : super(key: key);
  final Joueur joueur;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Assembly resume page"),);
  }
}
