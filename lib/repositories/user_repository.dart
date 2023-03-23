import 'package:epsumlorem/data/app_dao.dart';
import 'package:epsumlorem/data/models/post_model.dart';
import 'package:epsumlorem/data/models/user_profile_model.dart';

class UserRepository {
  static final appDao = AppDao();

  Future<int> createProfile(String name, String email, String password) async {
    int rowId = 0;
    UserProfile record = UserProfile(
      id: 0,
      name: name,
      email: email,
      password: password
    );

    UserProfile userProfile = await appDao.inserUserData(record);
    rowId = userProfile.id;
    return rowId;
  }
  Future<bool> userSignIn(String email, String password) async {
    return await appDao.signIn(email, password);
  }
}