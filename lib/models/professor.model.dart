import 'package:umah_front/models/user.model.dart';


List<Professor> professorFromJson(dynamic profList) => List<Professor>.from(profList.map((x) => Professor.fromJson(x)));


class Professor extends User {
  Professor(
      {required String id,
        required String firstname,
      required String email,
      required String lastname,
      required String phoneNumber,
      required String address,
      required String gender,
      required String dateBirth,
        required String this.cin,
      String? profileImage})
      : super(
            id: id,
            firstname: firstname,
            email: email,
            lastname: lastname,
            phoneNumber: phoneNumber,
            address: address,
            gender: gender,
            dateBirth: dateBirth,
            );
  String cin;


  factory Professor.fromJson(Map<String, dynamic> json) => Professor(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    email: json["email"],
    profileImage: json["profileImage"],
    dateBirth: '',
    cin: '',

  );

}
