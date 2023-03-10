import 'dart:developer';
import 'package:climbit/models/user_model.dart';
import 'package:climbit/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('users');

class UserService extends Service {
  static Future updateProfile({required UserModel user}) async {
    final documentReferencer = _collection.doc(user.id);
    return await documentReferencer.set(user.toJson());
  }

  static Future addUserDetails({
    required email,
    required username,
    required id,
    required photoUrl,
  }) async {
    final user = UserModel(
        username: username,
        email: email,
        id: id,
        photoUrl: Constants.userImageDefault);
    await _collection.doc(user.id).set(user.toJson());
  }

  static Future getUser(String userId) async {
    final user = await _collection.doc(userId).get();
    return UserModel.fromJson(user.data() as Map<String, dynamic>);
  }
}
