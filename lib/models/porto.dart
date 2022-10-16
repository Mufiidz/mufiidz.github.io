import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Porto {
  String id;
  String image;
  String link;
  String title;
  bool isVisible;
  Porto({
    required this.id,
    required this.image,
    required this.link,
    required this.title,
    required this.isVisible,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'link': link});
    result.addAll({'title': title});
    result.addAll({'isVisible': isVisible});

    return result;
  }

  factory Porto.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data();
    return Porto(
      id: snapshot.id,
      image: map['image'] ?? '',
      link: map['link'] ?? '',
      title: map['title'] ?? '',
      isVisible: map['isVisible'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Porto.fromJson(String source) =>
      Porto.fromFirebase(json.decode(source));

  @override
  String toString() {
    return 'Porto(id: $id, image: $image, link: $link, title: $title, isVisible: $isVisible)';
  }
}
