class Instrument {

  String id;

  String name;

  String category;

  String imageUrl;

  Instrument({required this.id,required this.name, required this.category, required this.imageUrl});


  factory Instrument.fromJson(Map<String, dynamic> json) => Instrument(
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    imageUrl: "assets/images/instrument/${json["name"]}.png"
  );


}

List<Instrument> instrumentFromJson(dynamic listInstrument) => List<Instrument>.from(listInstrument.map((x) => Instrument.fromJson(x)));

