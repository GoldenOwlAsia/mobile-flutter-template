import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/model/user/user.dart';
import '../../model/common/result.dart';

class UserRepositoryMock extends UserRepository {
  @override
  Future<MResult<MUser>> getUser(String id) {
    throw UnimplementedError();
  }
}
