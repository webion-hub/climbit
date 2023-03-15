import 'dart:developer';
import 'package:climbit/models/gym_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('gyms');

class GymService extends Service {
  static Future updateProfile({required GymModel gym}) async {
    final documentReferencer = _collection.doc(gym.id);
    return await documentReferencer.set(gym.toJson());
  }

  static Future addUserDetails({
    required name,
    required open,
    required address,
    required id,
    required info,
    required hours,
    required lastchange,
    required competition,
  }) async {
    final gym = GymModel(
      name: name,
      id: id,
      open: open,
      address: address,
      info: info,
      hours: hours,
      lastchange: lastchange,
      competition: competition,
    );
    await _collection.doc(gym.id).set(gym.toJson());
  }

  static Future getGym(String userId) async {
    final user = await _collection.doc('9Rt59pgN2vEIwoePFxF2').get();
    return GymModel.fromJson(user.data() as Map<String, dynamic>);
  }
}
