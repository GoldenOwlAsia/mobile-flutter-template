import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/model/common/result/result.dart';
import 'package:myapp/src/network/model/user/user.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<MResult<MUser>> getUser(String id) async {
    try {
      final result = FirebaseAuth.instance.currentUser;
      if (result == null) {
        return const MResult.error('Not user login');
      }
      final user =
          MUser(id: result.uid, email: result.email, name: result.displayName);
      return MResult.data(user);
    } catch (e) {
      return MResult.error(e);
    }
  }
}
