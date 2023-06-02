import 'package:flutter/material.dart';

import '../../../../tools/Style.dart';
import '../HomePage.dart';

class ShortCut extends StatelessWidget {
  const ShortCut({Key? key,
    required this.image,
    required this.text,
    required this.routing,
    required this.idJoueur})
      : super(key: key);
  final String image;
  final String text;
  final String idJoueur;
  final Widget routing;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(image),
      TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => routing,
          ));
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            backgroundColor:
            MaterialStateProperty.all<Color>(Style().light.shade900)),
        child: Text(text, style: const TextStyle(color: Colors.black)),
      )
    ]);
  }
}
