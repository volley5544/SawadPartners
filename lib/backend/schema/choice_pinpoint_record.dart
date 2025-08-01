import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChoicePinpointRecord extends FirestoreRecord {
  ChoicePinpointRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "statusName" field.
  List<String>? _statusName;
  List<String> get statusName => _statusName ?? const [];
  bool hasStatusName() => _statusName != null;

  // "reasonName" field.
  List<String>? _reasonName;
  List<String> get reasonName => _reasonName ?? const [];
  bool hasReasonName() => _reasonName != null;

  // "locationSeeName" field.
  List<String>? _locationSeeName;
  List<String> get locationSeeName => _locationSeeName ?? const [];
  bool hasLocationSeeName() => _locationSeeName != null;

  // "statusID" field.
  List<String>? _statusID;
  List<String> get statusID => _statusID ?? const [];
  bool hasStatusID() => _statusID != null;

  // "reasonID" field.
  List<String>? _reasonID;
  List<String> get reasonID => _reasonID ?? const [];
  bool hasReasonID() => _reasonID != null;

  // "locationSeeID" field.
  List<String>? _locationSeeID;
  List<String> get locationSeeID => _locationSeeID ?? const [];
  bool hasLocationSeeID() => _locationSeeID != null;

  void _initializeFields() {
    _statusName = getDataList(snapshotData['statusName']);
    _reasonName = getDataList(snapshotData['reasonName']);
    _locationSeeName = getDataList(snapshotData['locationSeeName']);
    _statusID = getDataList(snapshotData['statusID']);
    _reasonID = getDataList(snapshotData['reasonID']);
    _locationSeeID = getDataList(snapshotData['locationSeeID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('choicePinpoint');

  static Stream<ChoicePinpointRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChoicePinpointRecord.fromSnapshot(s));

  static Future<ChoicePinpointRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChoicePinpointRecord.fromSnapshot(s));

  static ChoicePinpointRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChoicePinpointRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChoicePinpointRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChoicePinpointRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChoicePinpointRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChoicePinpointRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChoicePinpointRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ChoicePinpointRecordDocumentEquality
    implements Equality<ChoicePinpointRecord> {
  const ChoicePinpointRecordDocumentEquality();

  @override
  bool equals(ChoicePinpointRecord? e1, ChoicePinpointRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.statusName, e2?.statusName) &&
        listEquality.equals(e1?.reasonName, e2?.reasonName) &&
        listEquality.equals(e1?.locationSeeName, e2?.locationSeeName) &&
        listEquality.equals(e1?.statusID, e2?.statusID) &&
        listEquality.equals(e1?.reasonID, e2?.reasonID) &&
        listEquality.equals(e1?.locationSeeID, e2?.locationSeeID);
  }

  @override
  int hash(ChoicePinpointRecord? e) => const ListEquality().hash([
        e?.statusName,
        e?.reasonName,
        e?.locationSeeName,
        e?.statusID,
        e?.reasonID,
        e?.locationSeeID
      ]);

  @override
  bool isValidKey(Object? o) => o is ChoicePinpointRecord;
}
