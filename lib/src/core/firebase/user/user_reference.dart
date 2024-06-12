import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/src/core/firebase/base_collection.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import '../../models/user/user.dart';

class UserReference extends BaseCollectionReference<UserModel> {
  UserReference()
      : super(
          FirebaseFirestore.instance
              .collection('users')
              .withConverter<UserModel>(
                fromFirestore: (snapshot, options) =>
                    UserModel.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<DataState<UserModel>> getOrAddUser(UserModel user) async {
    try {
      final result = await get(user.id);
      if (result is DataSuccess) {
        return result;
      } else {
        final DataState<UserModel> result = await set(user);
        return DataSuccess(result.data!);
      }
    } catch (e) {
      return DataFailed.exception(e);
    }
  }

  Future<DataState<List<UserModel>>> getUsers() async {
    try {
      final QuerySnapshot<UserModel> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return DataSuccess(docs);
    } catch (e) {
      return DataFailed.exception(e);
    }
  }
}
