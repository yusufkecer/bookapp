import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? id;
  IdModel({this.id});
}

abstract class BaseModel<T extends IdModel> {
  T fromMap(Map<String, dynamic> map);

  T? fromJson(DocumentSnapshot<Map<String, dynamic>>? json) {
    if (json == null) return null;
    json.data()!.addEntries([MapEntry('id', json.id)]);
    return fromMap(json.data()!);
  }
}
