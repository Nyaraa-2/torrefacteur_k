import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteur_k/API/page/assemblies_pages/CraftAssembly.dart';
import 'package:torrefacteur_k/main.dart';

import '../../../../tools/Style.dart';

class BottomCustomNavigation extends StatelessWidget {
  const BottomCustomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const MyHomePage(),
              ));
            },
            icon: Icon(
              Icons.dry,
              color: Style().tertiary,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const CraftAssemblyPage(),
              ));
            },
            icon: Icon(
              Icons.build,
              color: Style().tertiary,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const MyHomePage(),
              ));
            },
            icon: Icon(
              Icons.home,
              color: Style().primary,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.coffee_rounded,
              color: Style().tertiary,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.hotel_class_outlined,
              color: Style().tertiary,
            ))
      ],
    );
  }
}
