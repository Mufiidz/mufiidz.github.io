import 'package:cloud_firestore/cloud_firestore.dart';

class Link {
  String id;
  String title;
  String link;
  String image;
  String icon;
  String category;
  bool isVisible;

  Link({
    required this.id,
    required this.title,
    required this.link,
    required this.image,
    required this.icon,
    required this.category,
    required this.isVisible,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'link': link});
    result.addAll({'image': image});
    result.addAll({'icon': icon});
    result.addAll({'category': category});
    result.addAll({'isVisible': isVisible});

    return result;
  }

  factory Link.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data();
    final category = (map['category'] ?? '').toString();
    return Link(
      id: snapshot.id,
      title: map['title'] ?? '',
      link: map['link'] ?? '',
      image: map['image'] ?? '',
      icon: map['icon'] ?? '',
      category: category.isNotEmpty ? category : 'other',
      isVisible: map['isVisible'] ?? false,
    );
  }
}
