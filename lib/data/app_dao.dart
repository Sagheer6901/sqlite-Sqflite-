import 'dart:convert';

import 'package:epsumlorem/data/app_db.dart';
import 'package:epsumlorem/data/models/bookmark_model.dart';
import 'package:epsumlorem/data/models/post_model.dart';
import 'package:epsumlorem/data/models/user_profile_model.dart';

class AppDao{

  static final appDao = AppDao();
  final appDb = AppDB().db;

  final String blogPosts = "blog_posts";
  final String userData = "user_profile";
  final String bookMarks = "book_marks";

  Future<List<PostModel>> getBlogPosts() async {
    final db = await appDb;

    String query = "select * from $blogPosts order by id desc";
    final res = await db.rawQuery(query);
    List<PostModel> records = res.isNotEmpty ? res.map((c) => PostModel.fromMap(c)).toList() : [];
    return records;
  }


  Future<PostModel> insertPost(PostModel postModel) async {
    final db = await appDb;
    postModel.id = await db.insert(blogPosts, postModel.toUpsertMap());
    return postModel;

  }

  Future<UserProfile> inserUserData(UserProfile userProfile) async {
    final db = await appDb;
    userProfile.id = await db.insert(userData, userProfile.toUpsertMap());
    return userProfile;
  }


  Future<bool> signIn(String email,String password) async {
    final db = await appDb;
    String query = "select * from $userData where email_id = '$email' and password = '$password'";
    final res = await db.rawQuery(query);
    UserProfile? records = res.isNotEmpty ? UserProfile.fromMap(res.first): null;
    if(records !=null){
      return true;
    }
    else{
      return false;
    }
  }

  Future<BookMarkMdoel?> getMyFavoriteQuestion(String title, String authorEmail, int postedDate) async {
    final db = await appDb;
    String query = "select * from $bookMarks where title = $title and author_email = '$authorEmail' and posted_date = $postedDate";
    final res = await db.rawQuery(query);
    BookMarkMdoel? records = res.isNotEmpty ? BookMarkMdoel.fromMap(res.first): null;
    return records;
  }

  Future<bool> upsertFavoriteQuestion(PostModel postModel) async {
    final db = await appDb;
    BookMarkMdoel? record = await getMyFavoriteQuestion(postModel.title, postModel.authorEmail, postModel.postedDate);

    if(record != null){
      return await db.delete( bookMarks,
          where: 'post_id = ? and title = ? ',
          whereArgs: [postModel.id, postModel.title]) > 0;
    } else{

      int longDate = DateTime.now().millisecondsSinceEpoch;
      BookMarkMdoel record = BookMarkMdoel(
          id: 0,
          postId: postModel.id,
          title: postModel.title,
        description: postModel.description,
        authorName: postModel.authorName,
        authorEmail: postModel.authorEmail,
        image: postModel.image,
        postedDate: postModel.postedDate
      );
      return await db.insert(bookMarks, record.toUpsertMap())  > 0;


    }
  }

}