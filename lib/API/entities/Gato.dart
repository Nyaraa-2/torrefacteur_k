class Gato {
  int amertume;
  int gout;
  int odeur;
  int teneur;

  Gato(
      {required this.amertume,
      required this.gout,
      required this.odeur,
      required this.teneur,
      });

  factory Gato.fromJson(Map<String,dynamic> json){
    return Gato(
      amertume: json["amertume"],
      gout: json["gout"],
      odeur: json["odeaur"],
      teneur: json["teneur"]
    );
  }

  Map<String, dynamic> toJson() => {
    'amertume' : amertume,
    'gout' : gout,
    'odeaur' : odeur,
    'teneur' : teneur,
  };
}
