import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApiUrlRecord extends FirestoreRecord {
  ApiUrlRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "API_Url" field.
  String? _aPIUrl;
  String get aPIUrl => _aPIUrl ?? '';
  bool hasAPIUrl() => _aPIUrl != null;

  void _initializeFields() {
    _aPIUrl = snapshotData['API_Url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('API_URL');

  static Stream<ApiUrlRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApiUrlRecord.fromSnapshot(s));

  static Future<ApiUrlRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApiUrlRecord.fromSnapshot(s));

  static ApiUrlRecord fromSnapshot(DocumentSnapshot snapshot) => ApiUrlRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApiUrlRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApiUrlRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApiUrlRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApiUrlRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApiUrlRecordData({
  String? aPIUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'API_Url': aPIUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApiUrlRecordDocumentEquality implements Equality<ApiUrlRecord> {
  const ApiUrlRecordDocumentEquality();

  @override
  bool equals(ApiUrlRecord? e1, ApiUrlRecord? e2) {
    return e1?.aPIUrl == e2?.aPIUrl;
  }

  @override
  int hash(ApiUrlRecord? e) => const ListEquality().hash([e?.aPIUrl]);

  @override
  bool isValidKey(Object? o) => o is ApiUrlRecord;
}
