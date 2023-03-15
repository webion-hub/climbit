import 'package:cloud_firestore/cloud_firestore.dart';

class HoursModel {
  String day;
  String time;

  HoursModel({
    required this.day,
    required this.time,
  });

  HoursModel.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        time = json['time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['time'] = time;
    return data;
  }

  static HoursModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return HoursModel.fromJson(snapshot);
  }
}