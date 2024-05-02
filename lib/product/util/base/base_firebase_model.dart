import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? get id;
}

mixin FirebaseModel<T extends IdModel> {
  T fromMap(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>>? json) {
    if (json?.data() == null) return null;
    json!.data()!.addEntries([MapEntry('id', json.id)]);
    return fromMap(json.data()!);
  }
}
