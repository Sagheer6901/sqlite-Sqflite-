import 'dart:typed_data';

import 'package:epsumlorem/data/app_dao.dart';
import 'package:epsumlorem/data/models/post_model.dart';

class PostRepository {
  static final appDao = AppDao();


  Future<bool> upsertFavoriteRecord(PostModel postModel) async {
    bool isFavorite = await appDao.upsertFavoriteQuestion(postModel);
    return isFavorite;
  }


  Future<int> addPost(String title, String description, String autherName,String authorEmail, Uint8List? image, int postedDate) async {
    int rowId = 0;
    PostModel record = PostModel(
        id: 0,
      title: title,
      description: description ,
      authorName: autherName,
      authorEmail: authorEmail ,
      image: image! ,
      postedDate: postedDate,
       );

    PostModel updatedRecord = await appDao.insertPost(record);
    rowId = updatedRecord.id;
    return rowId;
  }
  Future<List<PostModel>> getBlogPosts() async {
    return await appDao.getBlogPosts();
  }

}