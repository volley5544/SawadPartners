import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCustomRecord extends FirestoreRecord {
  UserCustomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "locationId" field.
  String? _locationId;
  String get locationId => _locationId ?? '';
  bool hasLocationId() => _locationId != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _locationId = snapshotData['locationId'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userCustom');

  static Stream<UserCustomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCustomRecord.fromSnapshot(s));

  static Future<UserCustomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCustomRecord.fromSnapshot(s));

  static UserCustomRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCustomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCustomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCustomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCustomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCustomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCustomRecordData({
  DocumentReference? user,
  String? locationId,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'locationId': locationId,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCustomRecordDocumentEquality implements Equality<UserCustomRecord> {
  const UserCustomRecordDocumentEquality();

  @override
  bool equals(UserCustomRecord? e1, UserCustomRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.locationId == e2?.locationId &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(UserCustomRecord? e) =>
      const ListEquality().hash([e?.user, e?.locationId, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is UserCustomRecord;
}
