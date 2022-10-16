class PinnedGithub {
  String owner = '';
  String repo = '';
  String link = '';
  String description = '';
  String image = '';
  String language = '';
  String languageColor = '';
  dynamic stars = '';
  dynamic forks = '';

  PinnedGithub({
    required this.owner,
    required this.repo,
    required this.link,
    required this.description,
    required this.image,
    required this.language,
    required this.languageColor,
    required this.stars,
    required this.forks,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'owner': owner});
    result.addAll({'repo': repo});
    result.addAll({'link': link});
    result.addAll({'description': description});
    result.addAll({'image': image});
    result.addAll({'language': language});
    result.addAll({'languageColor': languageColor});
    result.addAll({'stars': stars});
    result.addAll({'forks': forks});

    return result;
  }

  factory PinnedGithub.fromJson(Map<String, dynamic> map) {
    return PinnedGithub(
      owner: map['owner'] ?? '',
      repo: map['repo'] ?? '',
      link: map['link'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      language: map['language'] ?? '',
      languageColor: map['languageColor'] ?? '',
      stars: map['stars'] ?? '',
      forks: map['forks'] ?? '',
    );
  }

  @override
  String toString() {
    return 'PinnedGithub(owner: $owner, repo: $repo, link: $link, description: $description, image: $image, language: $language, languageColor: $languageColor, stars: $stars, forks: $forks)';
  }
}
