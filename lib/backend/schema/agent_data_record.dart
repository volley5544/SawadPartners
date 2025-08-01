import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgentDataRecord extends FirestoreRecord {
  AgentDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "agent_code" field.
  List<String>? _agentCode;
  List<String> get agentCode => _agentCode ?? const [];
  bool hasAgentCode() => _agentCode != null;

  // "agent_name" field.
  List<String>? _agentName;
  List<String> get agentName => _agentName ?? const [];
  bool hasAgentName() => _agentName != null;

  // "agent_short_name" field.
  List<String>? _agentShortName;
  List<String> get agentShortName => _agentShortName ?? const [];
  bool hasAgentShortName() => _agentShortName != null;

  void _initializeFields() {
    _agentCode = getDataList(snapshotData['agent_code']);
    _agentName = getDataList(snapshotData['agent_name']);
    _agentShortName = getDataList(snapshotData['agent_short_name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AgentData');

  static Stream<AgentDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgentDataRecord.fromSnapshot(s));

  static Future<AgentDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgentDataRecord.fromSnapshot(s));

  static AgentDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgentDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgentDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgentDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgentDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgentDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgentDataRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AgentDataRecordDocumentEquality implements Equality<AgentDataRecord> {
  const AgentDataRecordDocumentEquality();

  @override
  bool equals(AgentDataRecord? e1, AgentDataRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.agentCode, e2?.agentCode) &&
        listEquality.equals(e1?.agentName, e2?.agentName) &&
        listEquality.equals(e1?.agentShortName, e2?.agentShortName);
  }

  @override
  int hash(AgentDataRecord? e) => const ListEquality()
      .hash([e?.agentCode, e?.agentName, e?.agentShortName]);

  @override
  bool isValidKey(Object? o) => o is AgentDataRecord;
}
