import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImgTopBannerRecord extends FirestoreRecord {
  ImgTopBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img_url" field.
  List<String>? _imgUrl;
  List<String> get imgUrl => _imgUrl ?? const [];
  bool hasImgUrl() => _imgUrl != null;

  // "link_url" field.
  List<String>? _linkUrl;
  List<String> get linkUrl => _linkUrl ?? const [];
  bool hasLinkUrl() => _linkUrl != null;

  // "use_Token" field.
  List<bool>? _useToken;
  List<bool> get useToken => _useToken ?? const [];
  bool hasUseToken() => _useToken != null;

  // "content_name" field.
  String? _contentName;
  String get contentName => _contentName ?? '';
  bool hasContentName() => _contentName != null;

  void _initializeFields() {
    _imgUrl = getDataList(snapshotData['img_url']);
    _linkUrl = getDataList(snapshotData['link_url']);
    _useToken = getDataList(snapshotData['use_Token']);
    _contentName = snapshotData['content_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imgTopBanner');

  static Stream<ImgTopBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImgTopBannerRecord.fromSnapshot(s));

  static Future<ImgTopBannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImgTopBannerRecord.fromSnapshot(s));

  static ImgTopBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImgTopBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImgTopBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImgTopBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImgTopBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImgTopBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImgTopBannerRecordData({
  String? contentName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content_name': contentName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImgTopBannerRecordDocumentEquality
    implements Equality<ImgTopBannerRecord> {
  const ImgTopBannerRecordDocumentEquality();

  @override
  bool equals(ImgTopBannerRecord? e1, ImgTopBannerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imgUrl, e2?.imgUrl) &&
        listEquality.equals(e1?.linkUrl, e2?.linkUrl) &&
        listEquality.equals(e1?.useToken, e2?.useToken) &&
        e1?.contentName == e2?.contentName;
  }

  @override
  int hash(ImgTopBannerRecord? e) => const ListEquality()
      .hash([e?.imgUrl, e?.linkUrl, e?.useToken, e?.contentName]);

  @override
  bool isValidKey(Object? o) => o is ImgTopBannerRecord;
}
