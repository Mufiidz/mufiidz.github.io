import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myporto/utils/firebase_repository.dart';

class About {
  String id;
  final String image;
  final String link;

  About({this.image, this.link});

  factory About.fromJson(Map<String, dynamic> map) {
    var image = map.containsKey("image") ? map["image"] : "";
    var link = map.containsKey("link") ? map["link"] : "";
    return About(
      image: image,
      link: link,
    );
  }

  static Stream<DocumentSnapshot> getAboutMe() {
    return aboutCollection.doc("me").snapshots();
  }
}