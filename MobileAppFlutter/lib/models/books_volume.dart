class BookVolume {
  VolumeInfo volumeInfo;

  BookVolume({this.volumeInfo});

  BookVolume.fromJson(Map<String, dynamic> json) {
    volumeInfo = json['volumeInfo'] != null
        ? new VolumeInfo.fromJson(json['volumeInfo'])
        : null;
  }
}

class VolumeInfo {
  String title;
  String subtitle;
  List<String> authors;
  String publisher;
  String publishedDate;
  int pageCount;
  Dimensions dimensions;
  int averageRating;
  int ratingsCount;
  ImageLinks imageLinks;
  String language;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.pageCount,
    this.dimensions,
    this.averageRating,
    this.ratingsCount,
    this.imageLinks,
    this.language
  });

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'].cast<String>();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    pageCount = json['pageCount'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
    imageLinks = json['imageLinks'] != null
        ? new ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
  }
}

class Dimensions {
  String height;

  Dimensions({this.height});

  Dimensions.fromJson(Map<String, dynamic> json) {
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    return data;
  }
}

class ImageLinks {
  String thumbnail;
  String small;

  ImageLinks({
    this.thumbnail,
    this.small,
  });

  ImageLinks.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    small = json['small'];
  }
}