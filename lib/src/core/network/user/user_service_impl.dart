import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/network/api_endpoint.dart';
import 'package:myapp/src/core/network/user/user_service.dart';
import 'package:myapp/src/core/utils/helper/network_helper.dart';

@LazySingleton(as: UserService)
class UserServiceImpl extends UserService {
  final NetworkHelper _networkUtil;

  UserServiceImpl(this._networkUtil);

  @override
  Future<Response> getUser(String id) async {
    final response = await _networkUtil.get(APIEndpoint.user);
    return response;
  }
}
