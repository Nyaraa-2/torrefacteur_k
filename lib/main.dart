import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteur_k/API/page/home_page/HomePage.dart';
import 'package:torrefacteur_k/firebase_options.dart';
import 'package:torrefacteur_k/tools/Style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'API/entities/Joueur.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFFEFC)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        ),
        body: Home()
        );
  }
}
