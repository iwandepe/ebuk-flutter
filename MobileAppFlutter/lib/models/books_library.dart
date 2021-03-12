class BooksLibrary {
  List<String> listVolumeId;

  BooksLibrary({this.listVolumeId});

  BooksLibrary.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      json['items'].forEach((jsonItem) {
        listVolumeId.add(jsonItem['id']);
      });
    }
  }
}