import 'package:myapp/src/network/model/user/user.dart';
import '../../model/common/result.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser(String id);
  Future<MResult<MUser>> getOrAddUser(MUser user);
  Future<MResult<List<MUser>>> getUsers();
}
