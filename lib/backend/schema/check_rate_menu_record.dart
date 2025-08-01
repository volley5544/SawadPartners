import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckRateMenuRecord extends FirestoreRecord {
  CheckRateMenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "menu_name" field.
  List<String>? _menuName;
  List<String> get menuName => _menuName ?? const [];
  bool hasMenuName() => _menuName != null;

  // "menu_icons" field.
  List<String>? _menuIcons;
  List<String> get menuIcons => _menuIcons ?? const [];
  bool hasMenuIcons() => _menuIcons != null;

  // "menu_icons_blur_hash" field.
  List<String>? _menuIconsBlurHash;
  List<String> get menuIconsBlurHash => _menuIconsBlurHash ?? const [];
  bool hasMenuIconsBlurHash() => _menuIconsBlurHash != null;

  // "menu_index" field.
  List<int>? _menuIndex;
  List<int> get menuIndex => _menuIndex ?? const [];
  bool hasMenuIndex() => _menuIndex != null;

  // "menu_link_url" field.
  List<String>? _menuLinkUrl;
  List<String> get menuLinkUrl => _menuLinkUrl ?? const [];
  bool hasMenuLinkUrl() => _menuLinkUrl != null;

  void _initializeFields() {
    _menuName = getDataList(snapshotData['menu_name']);
    _menuIcons = getDataList(snapshotData['menu_icons']);
    _menuIconsBlurHash = getDataList(snapshotData['menu_icons_blur_hash']);
    _menuIndex = getDataList(snapshotData['menu_index']);
    _menuLinkUrl = getDataList(snapshotData['menu_link_url']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CheckRateMenu');

  static Stream<CheckRateMenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckRateMenuRecord.fromSnapshot(s));

  static Future<CheckRateMenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckRateMenuRecord.fromSnapshot(s));

  static CheckRateMenuRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckRateMenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckRateMenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckRateMenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckRateMenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckRateMenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckRateMenuRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class CheckRateMenuRecordDocumentEquality
    implements Equality<CheckRateMenuRecord> {
  const CheckRateMenuRecordDocumentEquality();

  @override
  bool equals(CheckRateMenuRecord? e1, CheckRateMenuRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.menuName, e2?.menuName) &&
        listEquality.equals(e1?.menuIcons, e2?.menuIcons) &&
        listEquality.equals(e1?.menuIconsBlurHash, e2?.menuIconsBlurHash) &&
        listEquality.equals(e1?.menuIndex, e2?.menuIndex) &&
        listEquality.equals(e1?.menuLinkUrl, e2?.menuLinkUrl);
  }

  @override
  int hash(CheckRateMenuRecord? e) => const ListEquality().hash([
        e?.menuName,
        e?.menuIcons,
        e?.menuIconsBlurHash,
        e?.menuIndex,
        e?.menuLinkUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is CheckRateMenuRecord;
}
