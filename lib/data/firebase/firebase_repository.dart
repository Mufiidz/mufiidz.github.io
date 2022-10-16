import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myporto/models/link.dart';
import 'package:myporto/models/porto.dart';
import 'package:myporto/utils/const.dart';

abstract class FirebaseRepository {
  Future<List<Porto>> getAbout();
  Future<List<Porto>> getPortoDesign();
  Future<List<Porto>> getPortoPhoto();
  Future<List<Link>> getRelatedLink();
}

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseFirestore _firestore;

  FirebaseRepositoryImpl(this._firestore);
  @override
  Future<List<Porto>> getPortoDesign() async {
    final response = await _firestore
        .collection(Const.design)
        .where(Const.isVisible, isEqualTo: true)
        .get();
    return response.docs.map((e) => Porto.fromFirebase(e)).toList();
  }

  @override
  Future<List<Porto>> getPortoPhoto() async {
    final response = await _firestore
        .collection(Const.photography)
        .where(Const.isVisible, isEqualTo: true)
        .get();
    return response.docs.map((e) => Porto.fromFirebase(e)).toList();
  }

  @override
  Future<List<Link>> getRelatedLink() async {
    final response = await _firestore
        .collection(Const.links)
        .where(Const.isVisible, isEqualTo: true)
        .get();
    return response.docs.map((e) => Link.fromFirebase(e)).toList();
  }
  
  @override
  Future<List<Porto>> getAbout() async {
    final response = await _firestore
        .collection(Const.about)
        .get();
    return response.docs.map((e) => Porto.fromFirebase(e)).toList();
  }
}
