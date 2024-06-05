class BookList {
  List<Book>? book;

  BookList({this.book});

  BookList.fromJson(List<dynamic> json) {
    print("JBK: Jsonn"+json.toString());
    if (json != null) {
      book = <Book>[];
      json.forEach((v) {
        book!.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.book != null) {
      data['data'] = this.book!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Book {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Book({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Book.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}