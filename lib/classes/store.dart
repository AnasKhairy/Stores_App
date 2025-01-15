import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  String storeName;
  String picture;
  DateTime dateOfCollection;
  DateTime dateOfRetail;

  Store({
    required this.storeName,
    required this.picture,
    required this.dateOfCollection,
    required this.dateOfRetail,
  });

  Map<String, dynamic> toMap() {
    return {
      'storeName': storeName,
      'picture': picture,
      'dateOfCollection': dateOfCollection,
      'dateOfRetail': dateOfRetail,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      storeName: map['storeName'],
      picture: map['picture'],
      dateOfCollection: (map['dateOfCollection'] as Timestamp).toDate(),
      dateOfRetail: (map['dateOfRetail'] as Timestamp).toDate(),
    );
  }
}
