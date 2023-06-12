class CollectionKeys {
  static const chatRooms = 'chatRooms';
  static const onlineStatus = 'onlineStatus';
  static String messagesOf(String id) => '$chatRooms/$id/messages';
}

class FieldKeys {
  static const id = 'id';
  static const createdAt = 'created_at';
  static const updatedAt = 'updated_at';
  static const userIds = 'user_ids';
  static const idUserFrom = 'id_user_from';
}
