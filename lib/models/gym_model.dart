import 'package:climbit/models/hours_model.dart';
import 'package:climbit/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GymModel {
  String name;
  String id;
  bool open;
  String address;
  String info;
  List<HoursModel> hours;
  DateTime lastchange;
  bool competition;

  GymModel({
    required this.name,
    required this.id,
    required this.open,
    required this.address,
    required this.info,
    required this.hours,
    required this.lastchange,
    required this.competition,
  });

  GymModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        open = json['open'] as dynamic,
        address = json['address'],
        info = json['info'],
        hours = ((json['hours'] as List<dynamic>? ?? [])
            .map((s) => HoursModel.fromJson(s))
            .toList()),
        lastchange = Utils.dateTimeToTimeStamp(json['last change']),
        competition = json['competition'] as dynamic;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['open'] = open;
    data['address'] = address;
    data['info'] = info;
    data['hours'] = hours;
    data['hours'] = hours.map((hours) => hours.toJson()).toList();
    data['last change'] = lastchange;
    data['competition'] = competition;
    return data;
  }

  static GymModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return GymModel.fromJson(snapshot);
  }
}
