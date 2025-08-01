import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HideButtonRecord extends FirestoreRecord {
  HideButtonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "deleteButton" field.
  bool? _deleteButton;
  bool get deleteButton => _deleteButton ?? false;
  bool hasDeleteButton() => _deleteButton != null;

  // "registerButton" field.
  bool? _registerButton;
  bool get registerButton => _registerButton ?? false;
  bool hasRegisterButton() => _registerButton != null;

  void _initializeFields() {
    _deleteButton = snapshotData['deleteButton'] as bool?;
    _registerButton = snapshotData['registerButton'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hideButton');

  static Stream<HideButtonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HideButtonRecord.fromSnapshot(s));

  static Future<HideButtonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HideButtonRecord.fromSnapshot(s));

  static HideButtonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HideButtonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HideButtonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HideButtonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HideButtonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HideButtonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHideButtonRecordData({
  bool? deleteButton,
  bool? registerButton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'deleteButton': deleteButton,
      'registerButton': registerButton,
    }.withoutNulls,
  );

  return firestoreData;
}

class HideButtonRecordDocumentEquality implements Equality<HideButtonRecord> {
  const HideButtonRecordDocumentEquality();

  @override
  bool equals(HideButtonRecord? e1, HideButtonRecord? e2) {
    return e1?.deleteButton == e2?.deleteButton &&
        e1?.registerButton == e2?.registerButton;
  }

  @override
  int hash(HideButtonRecord? e) =>
      const ListEquality().hash([e?.deleteButton, e?.registerButton]);

  @override
  bool isValidKey(Object? o) => o is HideButtonRecord;
}
