import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myporto/utils/firebase_repository.dart';

class Porto {
  String id;
  final String image;
  final String link;
  final String linkDownload;
  final String title;
  final bool visibility;

  Porto({this.title, this.visibility, this.id, this.image, this.link, this.linkDownload});

  factory Porto.fromJson(Map<String, dynamic> map) {
    var link = (map.containsKey("link")) ? map['link'] : "https://mufiidz.github.io";
    var linkDownload = (map.containsKey("linkDownload") ? map['linkDownload'] : null);
    var title = map.containsKey("title") ? map['title'] : "";
    var visible = map.containsKey("isVisible") ? map['isVisible'] : true;
    return Porto(
      image: map['image'],
      link: link,
      linkDownload: linkDownload,
      title: title,
      visibility: visible
    );
  }

  static Stream<QuerySnapshot> getPortoPhotography() {
    return photoCollection.where("isVisible",isEqualTo: true).snapshots();
  }

  static Stream<QuerySnapshot> getPortoDesign() {
    return designCollection.where("isVisible",isEqualTo: true).snapshots();
  }

  static Stream<QuerySnapshot> getPortoGithub() {
    return githubCollection.where("isVisible",isEqualTo: true).snapshots();
  }
}
