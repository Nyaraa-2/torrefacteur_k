import 'package:flutter/material.dart';

import 'Style.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style().secondary,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.local_atm,
            color: Style().tertiary,
          ),
          Text("15")
        ],
      ),
      title: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_pin,
            size: 40,
            color: Style().tertiary,
          )),
      centerTitle: true,
      actions: [
        Icon(
          Icons.local_play,
          color: Style().tertiary,
        ),
        Text("0")
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
