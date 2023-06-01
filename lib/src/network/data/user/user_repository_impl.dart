import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/model/user/user.dart';

import '../../model/common/result.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<MResult<MUser>> getUser(String id) async {
    try {
      final result = FirebaseAuth.instance.currentUser;
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
