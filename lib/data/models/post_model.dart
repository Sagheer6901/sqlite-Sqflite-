import 'dart:convert';
import 'dart:typed_data';

class PostModel {

  int id;
  String title;
  String description;
  String authorName;
  String authorEmail;
  Uint8List image;
  int postedDate;


  PostModel({
    required this.id,
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
      'title': title,
      'description': description,
      'author_name': authorName,
      'author_email': authorEmail,
      'image': image,
      'posted_date': postedDate,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title']?.toString() ?? "",
      description: map['description']?.toString() ?? "",
      authorName: map['author_name']?.toString() ?? "",
      authorEmail: map['author_email']?.toString()?? "",
      image: map['image'],
      postedDate: map['posted_date']?.toInt() ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, description: $description, author_name: $authorName, author_email:$authorEmail, image: $image, posted_date: $postedDate)';
  }


}
