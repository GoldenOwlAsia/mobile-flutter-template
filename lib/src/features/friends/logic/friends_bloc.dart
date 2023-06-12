import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/handle.dart';
import 'package:myapp/src/network/model/user/user.dart';

class FriendsBloc extends Cubit<MHandle<List<MUser>>> {
  FriendsBloc() : super(MHandle()) {
    loadData();
  }
  Future loadData() async {
    emit(MHandle.loading());
    final result = await DomainManager().user.getUsers();
    emit(MHandle.result(result));
  }
}
