import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../../network/model/common/result.dart';
import '../../../../account/logic/account_bloc.dart';
import '../../model/online/chat_online.dart';
import '../../../../../network/firebase/base_collection.dart';
import '../collection_keys.dart';

class ChatOnlineReference extends BaseCollectionReference<MChatOnline> {
  ChatOnlineReference()
      : super(
          FirebaseFirestore.instance
              .collection(CollectionKeys.onlineStatus)
              .withConverter<MChatOnline>(
                fromFirestore: (snapshot, options) =>
                    MChatOnline.fromJsonDocument(
                  snapshot.data() as Map<String, dynamic>,
                  snapshot.id,
                ),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MChatOnline>> setOnline() async {
    final id = GetIt.I<AccountBloc>().state.user.id;
    if (id.isEmpty) {
      return MResult.error('User not found');
    }
    return await set(MChatOnline.online(id));
  }

  Future<MResult<MChatOnline>> setOffline([String? userId]) async {
    final id = userId ?? GetIt.I<AccountBloc>().state.user.id;
    if (id.isEmpty) {
      return MResult.error('User not found');
    }
    return await set(MChatOnline.offline(id));
  }

  Stream<List<MChatOnline>> listenMultipleUser(List<String> ids) {
    try {
      Query<MChatOnline> queryChat = ref.where(FieldKeys.id, whereIn: ids);
      return queryChat.snapshots().map((event) {
        final result = event.docs.map((e) => e.data()).toList();
        return result;
      });
    } catch (e) {
      debugPrint('$e');
      return const Stream.empty();
    }
  }
}
