import 'dart:html';

class Sample {
  String name;
  int age;
  String gender;
  List<String> hobi;
  Github? github;
  List<Article>? articles;
  Map<String, Contact> contact;

  Sample({
    required this.name,
    required this.age,
    required this.gender,
    required this.hobi,
    required this.github,
    required this.articles,
    required this.contact,
  });
  @override
  String toString() {
    return 'Sample{name: $name, age: $age, gender: $gender, hobi: $hobi, github: $github, articles: $articles, contact: $contact }';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    // baca property articles sebagai List (JSON Array)
    var listArticles = json["articles"] as List;

    // mapping listArticles kedalam bentuk MappedIterable<dynamic, Article>
    var iterableArticles = listArticles.map((article) {
      return Article.fromJson(article);
    });

    // kanversi dari MappedIterable kedalalm bentuk List<Article>
    var articles = List<Article>.from(iterableArticles);

    // baca json object contact
    var mapContact = json["contact"] as Map;

    // baca isi dari mapContact (json object)
    var mapContactContent = mapContact.map((key, value) {
      return MapEntry<String, Contact>(key, Contact.fromJson(value));
    });

    return Sample(
      name: json["name"],
      age: json["age"],
      gender: json["gender"],
      hobi: List<String>.from(json["hobi"]),
      github: Github.fromJson(json["github"]),
      articles: articles,
      contact: mapContactContent,
    );
  }
}

class Github {
  String username;
  int repository;
  Github({
    required this.username,
    required this.repository,
  });
  @override
  String toString() {
    return 'Github{username: $username, repository: $repository}';
  }

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(username: json["username"], repository: json["repository"]);
  }
}

class Article {
  int id;
  String title;
  String subtitle;
  Article({
    required this.id,
    required this.title,
    required this.subtitle,
  });
  @override
  String toString() {
    return 'Article{id: $id, title: $title, subtitle: $subtitle}';
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json["id"], title: json["title"], subtitle: json["subtitle"]);
  }
}

class Contact {
  String name;
  String phone;
  Contact({
    required this.name,
    required this.phone,
  });
  @override
  String toString() {
    return 'Contact{name: $name, phone: $phone}';
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(name: json["name"], phone: json["phone"]);
  }
}