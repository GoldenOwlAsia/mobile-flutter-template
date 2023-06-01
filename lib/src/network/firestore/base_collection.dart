import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/common/result.dart';

class BaseCollectionReference<T> {
  BaseCollectionReference(this.ref,
      {required this.setObjectId, required this.getObjectId});
  void log(dynamic value) => debugPrint('$value');
  final CollectionReference<T> ref;
  final T Function(T, String id) setObjectId;
  final String Function(T) getObjectId;

  Future<MResult<T>> get(String id) async {
    try {
      final DocumentSnapshot<T> doc = await ref.doc(id).get();
      if (doc.exists) {
        return MResult.success(doc.data());
      } else {
        return MResult.error('Document does not exist');
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Stream<DocumentSnapshot<T>> snapshots(String id) {
    return ref.doc(id).snapshots();
  }

  Future<MResult<T>> add(T item) async {
    try {
      final DocumentReference<T> doc =
          await ref.add(item).timeout(const Duration(seconds: 5));
      return MResult.success(setObjectId(item, doc.id));
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<T>> set(T item, {bool merge = true}) async {
    try {
      await ref
          .doc(getObjectId(item))
          .set(item, SetOptions(merge: merge))
          .timeout(const Duration(seconds: 5));
      return MResult.success(item);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<String>> remove(String id) async {
    try {
      await ref.doc(id).delete().timeout(const Duration(seconds: 5));
      return MResult.success(id);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<T>>> query() async {
    try {
      final QuerySnapshot<T> query =
          await ref.get().timeout(const Duration(seconds: 5));
      final docs = query.docs.map((e) => e.data()).toList();

      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
