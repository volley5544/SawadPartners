// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgentDataModelStruct extends FFFirebaseStruct {
  AgentDataModelStruct({
    List<String>? agentCode,
    List<String>? agentName,
    List<String>? agentShortName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _agentCode = agentCode,
        _agentName = agentName,
        _agentShortName = agentShortName,
        super(firestoreUtilData);

  // "agent_code" field.
  List<String>? _agentCode;
  List<String> get agentCode => _agentCode ?? const [];
  set agentCode(List<String>? val) => _agentCode = val;

  void updateAgentCode(Function(List<String>) updateFn) {
    updateFn(_agentCode ??= []);
  }

  bool hasAgentCode() => _agentCode != null;

  // "agent_name" field.
  List<String>? _agentName;
  List<String> get agentName => _agentName ?? const [];
  set agentName(List<String>? val) => _agentName = val;

  void updateAgentName(Function(List<String>) updateFn) {
    updateFn(_agentName ??= []);
  }

  bool hasAgentName() => _agentName != null;

  // "agent_short_name" field.
  List<String>? _agentShortName;
  List<String> get agentShortName => _agentShortName ?? const [];
  set agentShortName(List<String>? val) => _agentShortName = val;

  void updateAgentShortName(Function(List<String>) updateFn) {
    updateFn(_agentShortName ??= []);
  }

  bool hasAgentShortName() => _agentShortName != null;

  static AgentDataModelStruct fromMap(Map<String, dynamic> data) =>
      AgentDataModelStruct(
        agentCode: getDataList(data['agent_code']),
        agentName: getDataList(data['agent_name']),
        agentShortName: getDataList(data['agent_short_name']),
      );

  static AgentDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AgentDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'agent_code': _agentCode,
        'agent_name': _agentName,
        'agent_short_name': _agentShortName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'agent_code': serializeParam(
          _agentCode,
          ParamType.String,
          isList: true,
        ),
        'agent_name': serializeParam(
          _agentName,
          ParamType.String,
          isList: true,
        ),
        'agent_short_name': serializeParam(
          _agentShortName,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AgentDataModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgentDataModelStruct(
        agentCode: deserializeParam<String>(
          data['agent_code'],
          ParamType.String,
          true,
        ),
        agentName: deserializeParam<String>(
          data['agent_name'],
          ParamType.String,
          true,
        ),
        agentShortName: deserializeParam<String>(
          data['agent_short_name'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AgentDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AgentDataModelStruct &&
        listEquality.equals(agentCode, other.agentCode) &&
        listEquality.equals(agentName, other.agentName) &&
        listEquality.equals(agentShortName, other.agentShortName);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([agentCode, agentName, agentShortName]);
}

AgentDataModelStruct createAgentDataModelStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgentDataModelStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgentDataModelStruct? updateAgentDataModelStruct(
  AgentDataModelStruct? agentDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    agentDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgentDataModelStructData(
  Map<String, dynamic> firestoreData,
  AgentDataModelStruct? agentDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agentDataModel == null) {
    return;
  }
  if (agentDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && agentDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agentDataModelData =
      getAgentDataModelFirestoreData(agentDataModel, forFieldValue);
  final nestedData =
      agentDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = agentDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgentDataModelFirestoreData(
  AgentDataModelStruct? agentDataModel, [
  bool forFieldValue = false,
]) {
  if (agentDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agentDataModel.toMap());

  // Add any Firestore field values
  agentDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgentDataModelListFirestoreData(
  List<AgentDataModelStruct>? agentDataModels,
) =>
    agentDataModels
        ?.map((e) => getAgentDataModelFirestoreData(e, true))
        .toList() ??
    [];
