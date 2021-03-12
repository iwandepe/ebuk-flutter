class BooksLibrary {
  List<BookVolumeId> volumeIds;

  BooksLibrary({this.volumeIds});

  factory BooksLibrary.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      var list = json['items'] as List;
      List<BookVolumeId> volumeIdList = list.map((e) => BookVolumeId.fromJson(e)).toList(); 

      return BooksLibrary(
        volumeIds: volumeIdList 
      );
    }
    return BooksLibrary(volumeIds: null);
  }
}

class BookVolumeId {
  String id;

  BookVolumeId({this.id});

  factory BookVolumeId.fromJson(Map<String, dynamic> json) {
    return BookVolumeId(
      id: json['id']
    );
  }
}