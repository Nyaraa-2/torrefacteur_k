import 'package:flutter/material.dart';
import 'package:torrefacteur_k/API/page/home_page/widgets/BottomCustomNavigation.dart';
import 'package:torrefacteur_k/API/page/home_page/widgets/FieldList.dart';
import 'package:torrefacteur_k/API/page/home_page/widgets/HeaderHome.dart';
import 'package:torrefacteur_k/tools/GlobalConstants.dart';

import '../../../tools/Style.dart';
import '../../services/Services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJoueur(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GapBox(),
                Image.asset(GlobalConstants.logo),
                const GapBox(),
                Header(joueur: snapshot.data),
                const GapBox(),
                FieldList(joueur: snapshot.data),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  FloatingActionButton(
                    onPressed: () {
                    },
                    backgroundColor: Style().tertiary,
                    child: const Icon(Icons.add),
                  ),
                ]),
                const GapBox(),
                Container(
                  color: Style().secondary,
                  child: const BottomCustomNavigation(),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
