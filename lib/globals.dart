import 'ProfileUser.dart';
import 'ProfileUserData.dart';

class Global {
  static ProfileUser currentSessionUser = new ProfileUser();

  static final Map models = {

    ProfileUser: (data) => ProfileUser.fromMap(data),

  };


  static final ProfileUserData<ProfileUser> profileUserRef =
      ProfileUserData<ProfileUser>(collection: 'users');
}
