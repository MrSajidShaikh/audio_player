class MusicModal {
  late Data data;

  MusicModal({required this.data});

  factory MusicModal.fromMap(Map m1) {
    return MusicModal(data: Data.fromMap(m1["data"]));
  }
}

class Data {
  List<Result> result = [];

  Data({required this.result});

  factory Data.fromMap(Map m1) {
    return Data(
      result: (m1["results"] as List).map((e) => Result.fromMap(e)).toList(),
    );
  }
}

class Result {
  late String name, label;
  late Album album;
  List<SongImage> image = [], downloadUrl = [];

  Result(
      {required this.name,
        required this.label,
        required this.image,
        required this.downloadUrl,
        required this.album});

  factory Result.fromMap(Map m1) {
    return Result(
      name: m1["name"],
      label: m1["label"],
      image: (m1["image"] as List).map((e) => SongImage.fromMap(e)).toList(),
      downloadUrl: (m1["downloadUrl"] as List).map((e) => SongImage.fromMap(e)).toList(),
      album: Album.fromMap(m1["album"]),
    );
  }
}

class SongImage {
  late String quality, url;

  SongImage({required this.quality, required this.url});

  factory SongImage.fromMap(Map m1) {
    return SongImage(quality: m1["quality"], url: m1["url"]);
  }
}

class Album {
  late String name;

  Album({required this.name});

  factory Album.fromMap(Map m1) {
    return Album(name: m1["name"]);
  }
}