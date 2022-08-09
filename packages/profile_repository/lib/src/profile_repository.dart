import 'package:profile_repository/src/models/profile.dart';

class ProfileRepository {
  ProfileRepository._privateConstructor();

  static final ProfileRepository _instance =
      ProfileRepository._privateConstructor();

  factory ProfileRepository() {
    return _instance;
  }

  Profile curProfile =
      Profile(sId: '0', imageUrl: 'assets/images/dog.jpg', name: 'dog');

  Future<List<Profile>> fetchProfile() async {
    var list = <Profile>[
      Profile(sId: '0', imageUrl: 'assets/images/dog.jpg', name: 'dog'),
      Profile(sId: '1', imageUrl: 'assets/images/episode_1.jpg', name: 'dog_1'),
      Profile(sId: '2', imageUrl: 'assets/images/episode_2.jpg', name: 'dog_2')
    ];
    return Future.value(list);
  }

  void saveProfile(Profile profile) {
    /*
    try {
      return _firebaseFirestore
          .collection(_leaderboardCollectionName)
          .add(entry.toJson());
    } on Exception catch (error, stackTrace) {
      throw AddLeaderboardEntryException(error, stackTrace);
    }*/
    print("saveProfile : $profile");
    curProfile = profile;
  }
}
