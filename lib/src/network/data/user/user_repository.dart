import 'package:myapp/src/network/model/common/result/result.dart';
import 'package:myapp/src/network/model/user/user.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser(String id);
}
