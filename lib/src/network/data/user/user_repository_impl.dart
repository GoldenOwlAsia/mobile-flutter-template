import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<MResult<MUser>> getUser(String id) async {
    try {
      final result = await FirebaseAuth.instance.currentUser;
      if (result == null) {
        return MResult.error('Not user login');
      }
      final user =
          MUser(id: result.uid, email: result.email, name: result.displayName);
      return MResult.success(user);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
