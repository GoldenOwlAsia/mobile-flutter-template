import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser(String id);
}
