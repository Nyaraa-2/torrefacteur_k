import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:torrefacteur_k/API/entities/Kafe.dart';
import 'package:torrefacteur_k/API/page/home_page/widgets/HeaderHome.dart';
import 'package:uuid/uuid.dart';
import '../../../../tools/Shovel.dart';
import '../../../../tools/Style.dart';
import '../../../entities/Champ.dart';
import '../../../entities/Plant.dart';
import '../../../services/Services.dart';
import '../../home_page/HomePage.dart';

/// Entête de la page champ
class FieldWidget extends StatelessWidget {
  const FieldWidget({Key? key, required this.champ}) : super(key: key);
  final Champ champ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${champ.name}"),
      subtitle: Text("Spécification du champs : ${champ.specification}"),
      trailing: Icon(Icons.eco, color: Style().tertiary),
    );
  }
}

/// Liste des plants
class BodyFieldPage extends StatefulWidget {
  const BodyFieldPage({Key? key, required this.champ, required this.idJoueur})
      : super(key: key);
  final Champ champ;
  final String idJoueur;

  @override
  State<BodyFieldPage> createState() => _BodyFieldPageState();
}

class _BodyFieldPageState extends State<BodyFieldPage> {
  List<Plant> buildPlantList = [];
  void _updatePlantList(Plant plant, bool isGathering) {
    setState(() {
      buildPlantList[int.parse(plant.id)] = plant;
      if (isGathering == true) {
        deletePlant(plant.id,widget.idJoueur,widget.champ.id);
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    buildPlantList = setList(widget.champ.plants);
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var item in buildPlantList.take(2))
              CounterWidget(
                item: item,
                idJoueur: widget.idJoueur,
                idChamp: widget.champ.id,
                updatePlants: _updatePlantList,
              )
          ],
        ),
        const GapBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var item in buildPlantList.skip(2).take(2))
              CounterWidget(
                item: item,
                idJoueur: widget.idJoueur,
                idChamp: widget.champ.id,
                updatePlants: _updatePlantList,
              )
          ],
        ),
      ],
    ));
  }

  /**
   * Retourne une liste de plant contenant 4 éléments
   */
  List<Plant> setList(List<Plant> initialData) {
    int howManyToAdd = 4 - initialData.length;
    for (int i = 0; i != howManyToAdd; i++) {
      initialData.add(Plant.fromAnotherSource((i).toString()));
    }
    return initialData;
  }
}

/// Génération des compteurs
class CounterWidget extends StatelessWidget {
  const CounterWidget(
      {Key? key,
      required this.item,
      required this.idJoueur,
      required this.idChamp,
      required this.updatePlants})
      : super(key: key);
  final Plant item;
  final String idJoueur;
  final String idChamp;
  final Function updatePlants;
  static const String assetHarvest = "assets/images/NaturalFood.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item.kafe == null
            ? Opacity(opacity: 0.4, child: Image.asset(assetHarvest))
            : Image.asset(assetHarvest),
        item.kafe == null
            ? TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomModal(
                          shovel: Shovel(idJoueur, idChamp, item.id),
                          updatePlants: updatePlants);
                    },
                  );
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Style().light.shade900)),
                child: const Text("Planter",
                    style: TextStyle(color: Colors.black)),
              )
            : Text("${item.kafe?.nom}"),
        item.kafe == null
            ? const Text("")
            : CountdownTimer(
                endTime: item.temps + 1000 * int.parse(item.kafe!.temps),
                textStyle: TextStyle(color: Style().tertiary),
                endWidget: TextButton(
                  onPressed: () {
                    setRecolte(item.kafe!,idJoueur);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Vous avez récolté ${item.kafe!.production}g de café ${item.kafe!.nom}"),
                    ));
                    item.kafe = null;
                    updatePlants(item,true);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Style().light.shade900)),
                  child: const Text("Récolter",
                      style: TextStyle(color: Colors.black)),
                )),
      ],
    );
  }
}

/// Modal
class CustomModal extends StatelessWidget {
  const CustomModal(
      {Key? key, required this.updatePlants, required this.shovel})
      : super(key: key);
  final Shovel shovel;
  final Function updatePlants;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getKafes(),
        builder: (BuildContext context, AsyncSnapshot<List<Kafe>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<Kafe> kafes = snapshot.data!;
            return Container(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: kafes.length,
                itemBuilder: (context, index) {
                  Kafe current = kafes[index];
                  return ModalContent(
                    current: current,
                    shovel: shovel,
                    updatePlants: updatePlants,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    indent: 10,
                  );
                },
              ),
            ));
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class ModalContent extends StatelessWidget {
  const ModalContent(
      {Key? key,
      required this.current,
      required this.updatePlants,
      required this.shovel})
      : super(key: key);
  final Kafe current;
  final Shovel shovel;
  final Function updatePlants;
  static const String gout = "gout";
  static const String odeur = "gout";
  static const String amertume = "gout";
  static const String teneur = "gout";

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      ListTile(
          trailing: IconButton(
            icon: const Icon(Icons.coffee),
            color: Style().tertiary,
            onPressed: () {
              Plant plant = Plant(
                kafe: current,
                temps: DateTime.now().millisecondsSinceEpoch,
                id: shovel.idPlant,
              );
              addPlantInDatabase(shovel.idJoueur, shovel.idChamp, plant);
              updatePlants(plant,false);
              Navigator.pop(context);
            },
          ),
          title: Text(current.nom),
          subtitle: Text("Caractéristiques")),
      Text("Coût : ${current.cout}"),
      Text("Production : ${current.production}"),
      Text(
          "Temps : ${(double.parse(current.temps) / 60).toStringAsFixed(0)} minute(s)"),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GatoContent(propName: gout, value: current.gato.gout),
            GatoContent(propName: amertume, value: current.gato.amertume),
            GatoContent(propName: teneur, value: current.gato.teneur),
            GatoContent(propName: odeur, value: current.gato.odeur),
          ],
        ),
      ),
    ]));
  }
}

class GatoContent extends StatelessWidget {
  const GatoContent({Key? key, required this.propName, required this.value})
      : super(key: key);
  final String propName;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Style().secondary,
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(propName[0].toLowerCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value.toString())
            ],
          ),
        ));
  }
}
