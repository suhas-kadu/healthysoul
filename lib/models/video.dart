class Video {
  // String id;
  // String title;
  // String description;
  Id id;
  Snippet snippet;

  Video({required this.id, required this.snippet});

  factory Video.fromMap(Map<String, dynamic> data) {
    print("in video factroy: ${data}");
    return Video(
      id: Id.fromMap(data["id"]),
      snippet: Snippet.fromMap(data["snippet"]),
    );
  }
}

class Id {
  String kind;
  String videoId;

  Id({required this.kind, required this.videoId});

  factory Id.fromMap(Map<String, dynamic> id) {
    print("in id factroy: ${id['kind']}");
    return Id(kind: id["kind"], videoId: id["videoId"]);
  }
}

class Snippet {
  String title;
  String description;

  Snippet({required this.title, required this.description});

  factory Snippet.fromMap(Map<String, dynamic> data) {
    print("in snippet factroy: ${data}");
    return Snippet(title: data["title"], description: data["description"]);
  }
}
