import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference aboutCollection = _firestore.collection('about');

final CollectionReference photoCollection = _firestore.collection('photography');

final CollectionReference designCollection = _firestore.collection('design');

final CollectionReference githubCollection = _firestore.collection('github');
