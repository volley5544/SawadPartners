import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppContentFormRecord extends FirestoreRecord {
  AppContentFormRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "partner_name" field.
  String? _partnerName;
  String get partnerName => _partnerName ?? '';
  bool hasPartnerName() => _partnerName != null;

  // "content_title" field.
  String? _contentTitle;
  String get contentTitle => _contentTitle ?? '';
  bool hasContentTitle() => _contentTitle != null;

  // "content_body" field.
  String? _contentBody;
  String get contentBody => _contentBody ?? '';
  bool hasContentBody() => _contentBody != null;

  // "theme_color" field.
  Color? _themeColor;
  Color? get themeColor => _themeColor;
  bool hasThemeColor() => _themeColor != null;

  void _initializeFields() {
    _partnerName = snapshotData['partner_name'] as String?;
    _contentTitle = snapshotData['content_title'] as String?;
    _contentBody = snapshotData['content_body'] as String?;
    _themeColor = getSchemaColor(snapshotData['theme_color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AppContentForm');

  static Stream<AppContentFormRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppContentFormRecord.fromSnapshot(s));

  static Future<AppContentFormRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppContentFormRecord.fromSnapshot(s));

  static AppContentFormRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppContentFormRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppContentFormRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppContentFormRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppContentFormRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppContentFormRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppContentFormRecordData({
  String? partnerName,
  String? contentTitle,
  String? contentBody,
  Color? themeColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'partner_name': partnerName,
      'content_title': contentTitle,
      'content_body': contentBody,
      'theme_color': themeColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppContentFormRecordDocumentEquality
    implements Equality<AppContentFormRecord> {
  const AppContentFormRecordDocumentEquality();

  @override
  bool equals(AppContentFormRecord? e1, AppContentFormRecord? e2) {
    return e1?.partnerName == e2?.partnerName &&
        e1?.contentTitle == e2?.contentTitle &&
        e1?.contentBody == e2?.contentBody &&
        e1?.themeColor == e2?.themeColor;
  }

  @override
  int hash(AppContentFormRecord? e) => const ListEquality()
      .hash([e?.partnerName, e?.contentTitle, e?.contentBody, e?.themeColor]);

  @override
  bool isValidKey(Object? o) => o is AppContentFormRecord;
}
