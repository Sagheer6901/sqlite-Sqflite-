import 'dart:convert';
import 'dart:typed_data';

class BookMarkMdoel {

  int id;
  int postId;
  String title;
  String description;
  String authorName;
  String authorEmail;
  Uint8List image;
  int postedDate;


  BookMarkMdoel({
    required this.id,
    required this.postId,
    required this.title,
    required this.description,
    required this.authorName,
    required this.authorEmail,
    required this.image,
    required this.postedDate,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_id': postId,
      'title': title,
      'description': description,
      'author_name': authorName,
      'author_email': authorEmail,
      'image': image,
      'posted_date': postedDate,
    };
  }
  Map<String, dynamic> toUpsertMap() {
    return {
      'post_id': postId,
      'title': title,
      'description': description,
      'author_name': authorName,
      'author_email': authorEmail,
      'image': image,
      'posted_date': postedDate,
    };
  }

  factory BookMarkMdoel.fromMap(Map<String, dynamic> map) {
    return BookMarkMdoel(
      id: map['id']?.toInt() ?? 0,
      postId: map['post_id']?.toInt() ?? 0,
      title: map['title']?.toString() ?? "",
      description: map['description']?.toString() ?? "",
      authorName: map['author_name']?.toString() ?? "",
      authorEmail: map['author_email']?.toString()?? "",
      image: map['image']?.toInt() ?? "",
      postedDate: map['posted_date']?.toInt() ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory BookMarkMdoel.fromJson(String source) => BookMarkMdoel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookMarkModel(id: $id, post_id:$postId, title: $title, description: $description, author_name: $authorName, author_email:$authorEmail, image: $image, posted_date: $postedDate)';
  }


}
