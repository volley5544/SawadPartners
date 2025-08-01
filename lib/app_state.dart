import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _firstUseApp =
          await secureStorage.getBool('ff_firstUseApp') ?? _firstUseApp;
    });
    await _safeInitAsync(() async {
      _pinCodeAuth =
          await secureStorage.getString('ff_pinCodeAuth') ?? _pinCodeAuth;
    });
    await _safeInitAsync(() async {
      _LoggedIn = await secureStorage.getBool('ff_LoggedIn') ?? _LoggedIn;
    });
    await _safeInitAsync(() async {
      _ApiUrlLink =
          await secureStorage.getString('ff_ApiUrlLink') ?? _ApiUrlLink;
    });
    await _safeInitAsync(() async {
      _profileID = await secureStorage.getString('ff_profileID') ?? _profileID;
    });
    await _safeInitAsync(() async {
      _agentCode = await secureStorage.getString('ff_agentCode') ?? _agentCode;
    });
    await _safeInitAsync(() async {
      _agentName = await secureStorage.getString('ff_agentName') ?? _agentName;
    });
    await _safeInitAsync(() async {
      _refIDlist =
          await secureStorage.getStringList('ff_refIDlist') ?? _refIDlist;
    });
    await _safeInitAsync(() async {
      _Contractlist =
          await secureStorage.getStringList('ff_Contractlist') ?? _Contractlist;
    });
    await _safeInitAsync(() async {
      _ThaiID1list =
          await secureStorage.getStringList('ff_ThaiID1list') ?? _ThaiID1list;
    });
    await _safeInitAsync(() async {
      _CustomerNamelist =
          await secureStorage.getStringList('ff_CustomerNamelist') ??
              _CustomerNamelist;
    });
    await _safeInitAsync(() async {
      _Addresslist =
          await secureStorage.getStringList('ff_Addresslist') ?? _Addresslist;
    });
    await _safeInitAsync(() async {
      _Districtlist =
          await secureStorage.getStringList('ff_Districtlist') ?? _Districtlist;
    });
    await _safeInitAsync(() async {
      _Provincelist =
          await secureStorage.getStringList('ff_Provincelist') ?? _Provincelist;
    });
    await _safeInitAsync(() async {
      _ZipCodelist =
          await secureStorage.getStringList('ff_ZipCodelist') ?? _ZipCodelist;
    });
    await _safeInitAsync(() async {
      _Telephonelist = await secureStorage.getStringList('ff_Telephonelist') ??
          _Telephonelist;
    });
    await _safeInitAsync(() async {
      _CarBrandlist =
          await secureStorage.getStringList('ff_CarBrandlist') ?? _CarBrandlist;
    });
    await _safeInitAsync(() async {
      _Colorlist =
          await secureStorage.getStringList('ff_Colorlist') ?? _Colorlist;
    });
    await _safeInitAsync(() async {
      _Surveyorlist =
          await secureStorage.getStringList('ff_Surveyorlist') ?? _Surveyorlist;
    });
    await _safeInitAsync(() async {
      _StatusPinPointlist =
          await secureStorage.getStringList('ff_StatusPinPointlist') ??
              _StatusPinPointlist;
    });
    await _safeInitAsync(() async {
      _callPinpoint =
          await secureStorage.getBool('ff_callPinpoint') ?? _callPinpoint;
    });
    await _safeInitAsync(() async {
      _customerNamePending =
          await secureStorage.getStringList('ff_customerNamePending') ??
              _customerNamePending;
    });
    await _safeInitAsync(() async {
      _thaiIDPending = await secureStorage.getStringList('ff_thaiIDPending') ??
          _thaiIDPending;
    });
    await _safeInitAsync(() async {
      _contractPending =
          await secureStorage.getStringList('ff_contractPending') ??
              _contractPending;
    });
    await _safeInitAsync(() async {
      _addressPending =
          await secureStorage.getStringList('ff_addressPending') ??
              _addressPending;
    });
    await _safeInitAsync(() async {
      _districtPending =
          await secureStorage.getStringList('ff_districtPending') ??
              _districtPending;
    });
    await _safeInitAsync(() async {
      _provincePending =
          await secureStorage.getStringList('ff_provincePending') ??
              _provincePending;
    });
    await _safeInitAsync(() async {
      _postCodePending =
          await secureStorage.getStringList('ff_postCodePending') ??
              _postCodePending;
    });
    await _safeInitAsync(() async {
      _phoneNumberPending =
          await secureStorage.getStringList('ff_phoneNumberPending') ??
              _phoneNumberPending;
    });
    await _safeInitAsync(() async {
      _carbrandPending =
          await secureStorage.getStringList('ff_carbrandPending') ??
              _carbrandPending;
    });
    await _safeInitAsync(() async {
      _carcolorPending =
          await secureStorage.getStringList('ff_carcolorPending') ??
              _carcolorPending;
    });
    await _safeInitAsync(() async {
      _ans1Pending =
          await secureStorage.getStringList('ff_ans1Pending') ?? _ans1Pending;
    });
    await _safeInitAsync(() async {
      _ans2Pending =
          await secureStorage.getStringList('ff_ans2Pending') ?? _ans2Pending;
    });
    await _safeInitAsync(() async {
      _dropbox1Pending =
          await secureStorage.getStringList('ff_dropbox1Pending') ??
              _dropbox1Pending;
    });
    await _safeInitAsync(() async {
      _dropbox2Pending =
          await secureStorage.getStringList('ff_dropbox2Pending') ??
              _dropbox2Pending;
    });
    await _safeInitAsync(() async {
      _dropbox3Pending =
          await secureStorage.getStringList('ff_dropbox3Pending') ??
              _dropbox3Pending;
    });
    await _safeInitAsync(() async {
      _refIDPending =
          await secureStorage.getStringList('ff_refIDPending') ?? _refIDPending;
    });
    await _safeInitAsync(() async {
      _latlngPending = (await secureStorage.getStringList('ff_latlngPending'))
              ?.map(latLngFromString)
              .withoutNulls ??
          _latlngPending;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _channel = [];
  List<String> get channel => _channel;
  set channel(List<String> value) {
    _channel = value;
  }

  void addToChannel(String value) {
    channel.add(value);
  }

  void removeFromChannel(String value) {
    channel.remove(value);
  }

  void removeAtIndexFromChannel(int index) {
    channel.removeAt(index);
  }

  void updateChannelAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    channel[index] = updateFn(_channel[index]);
  }

  void insertAtIndexInChannel(int index, String value) {
    channel.insert(index, value);
  }

  List<String> _firstName = [];
  List<String> get firstName => _firstName;
  set firstName(List<String> value) {
    _firstName = value;
  }

  void addToFirstName(String value) {
    firstName.add(value);
  }

  void removeFromFirstName(String value) {
    firstName.remove(value);
  }

  void removeAtIndexFromFirstName(int index) {
    firstName.removeAt(index);
  }

  void updateFirstNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    firstName[index] = updateFn(_firstName[index]);
  }

  void insertAtIndexInFirstName(int index, String value) {
    firstName.insert(index, value);
  }

  List<String> _phoneNumber = [];
  List<String> get phoneNumber => _phoneNumber;
  set phoneNumber(List<String> value) {
    _phoneNumber = value;
  }

  void addToPhoneNumber(String value) {
    phoneNumber.add(value);
  }

  void removeFromPhoneNumber(String value) {
    phoneNumber.remove(value);
  }

  void removeAtIndexFromPhoneNumber(int index) {
    phoneNumber.removeAt(index);
  }

  void updatePhoneNumberAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    phoneNumber[index] = updateFn(_phoneNumber[index]);
  }

  void insertAtIndexInPhoneNumber(int index, String value) {
    phoneNumber.insert(index, value);
  }

  List<String> _employeeID = [];
  List<String> get employeeID => _employeeID;
  set employeeID(List<String> value) {
    _employeeID = value;
  }

  void addToEmployeeID(String value) {
    employeeID.add(value);
  }

  void removeFromEmployeeID(String value) {
    employeeID.remove(value);
  }

  void removeAtIndexFromEmployeeID(int index) {
    employeeID.removeAt(index);
  }

  void updateEmployeeIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    employeeID[index] = updateFn(_employeeID[index]);
  }

  void insertAtIndexInEmployeeID(int index, String value) {
    employeeID.insert(index, value);
  }

  List<String> _vehicleName = [];
  List<String> get vehicleName => _vehicleName;
  set vehicleName(List<String> value) {
    _vehicleName = value;
  }

  void addToVehicleName(String value) {
    vehicleName.add(value);
  }

  void removeFromVehicleName(String value) {
    vehicleName.remove(value);
  }

  void removeAtIndexFromVehicleName(int index) {
    vehicleName.removeAt(index);
  }

  void updateVehicleNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    vehicleName[index] = updateFn(_vehicleName[index]);
  }

  void insertAtIndexInVehicleName(int index, String value) {
    vehicleName.insert(index, value);
  }

  List<String> _amountRequest = [];
  List<String> get amountRequest => _amountRequest;
  set amountRequest(List<String> value) {
    _amountRequest = value;
  }

  void addToAmountRequest(String value) {
    amountRequest.add(value);
  }

  void removeFromAmountRequest(String value) {
    amountRequest.remove(value);
  }

  void removeAtIndexFromAmountRequest(int index) {
    amountRequest.removeAt(index);
  }

  void updateAmountRequestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    amountRequest[index] = updateFn(_amountRequest[index]);
  }

  void insertAtIndexInAmountRequest(int index, String value) {
    amountRequest.insert(index, value);
  }

  List<String> _defaultList1 = ['Hello World'];
  List<String> get defaultList1 => _defaultList1;
  set defaultList1(List<String> value) {
    _defaultList1 = value;
  }

  void addToDefaultList1(String value) {
    defaultList1.add(value);
  }

  void removeFromDefaultList1(String value) {
    defaultList1.remove(value);
  }

  void removeAtIndexFromDefaultList1(int index) {
    defaultList1.removeAt(index);
  }

  void updateDefaultList1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList1[index] = updateFn(_defaultList1[index]);
  }

  void insertAtIndexInDefaultList1(int index, String value) {
    defaultList1.insert(index, value);
  }

  List<String> _branchCode = [];
  List<String> get branchCode => _branchCode;
  set branchCode(List<String> value) {
    _branchCode = value;
  }

  void addToBranchCode(String value) {
    branchCode.add(value);
  }

  void removeFromBranchCode(String value) {
    branchCode.remove(value);
  }

  void removeAtIndexFromBranchCode(int index) {
    branchCode.removeAt(index);
  }

  void updateBranchCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchCode[index] = updateFn(_branchCode[index]);
  }

  void insertAtIndexInBranchCode(int index, String value) {
    branchCode.insert(index, value);
  }

  List<String> _leadID = ['Hello World', 'Hello World', 'Hello World'];
  List<String> get leadID => _leadID;
  set leadID(List<String> value) {
    _leadID = value;
  }

  void addToLeadID(String value) {
    leadID.add(value);
  }

  void removeFromLeadID(String value) {
    leadID.remove(value);
  }

  void removeAtIndexFromLeadID(int index) {
    leadID.removeAt(index);
  }

  void updateLeadIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadID[index] = updateFn(_leadID[index]);
  }

  void insertAtIndexInLeadID(int index, String value) {
    leadID.insert(index, value);
  }

  List<String> _createdTime = [];
  List<String> get createdTime => _createdTime;
  set createdTime(List<String> value) {
    _createdTime = value;
  }

  void addToCreatedTime(String value) {
    createdTime.add(value);
  }

  void removeFromCreatedTime(String value) {
    createdTime.remove(value);
  }

  void removeAtIndexFromCreatedTime(int index) {
    createdTime.removeAt(index);
  }

  void updateCreatedTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    createdTime[index] = updateFn(_createdTime[index]);
  }

  void insertAtIndexInCreatedTime(int index, String value) {
    createdTime.insert(index, value);
  }

  bool _hideItem = false;
  bool get hideItem => _hideItem;
  set hideItem(bool value) {
    _hideItem = value;
  }

  String _accessToken = '1234';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    secureStorage.setString('ff_accessToken', value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  List<String> _bannerImgList = [];
  List<String> get bannerImgList => _bannerImgList;
  set bannerImgList(List<String> value) {
    _bannerImgList = value;
  }

  void addToBannerImgList(String value) {
    bannerImgList.add(value);
  }

  void removeFromBannerImgList(String value) {
    bannerImgList.remove(value);
  }

  void removeAtIndexFromBannerImgList(int index) {
    bannerImgList.removeAt(index);
  }

  void updateBannerImgListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bannerImgList[index] = updateFn(_bannerImgList[index]);
  }

  void insertAtIndexInBannerImgList(int index, String value) {
    bannerImgList.insert(index, value);
  }

  bool _listviewPositionState = false;
  bool get listviewPositionState => _listviewPositionState;
  set listviewPositionState(bool value) {
    _listviewPositionState = value;
  }

  int _introImageIndex = 0;
  int get introImageIndex => _introImageIndex;
  set introImageIndex(int value) {
    _introImageIndex = value;
  }

  bool _firstUseApp = false;
  bool get firstUseApp => _firstUseApp;
  set firstUseApp(bool value) {
    _firstUseApp = value;
    secureStorage.setBool('ff_firstUseApp', value);
  }

  void deleteFirstUseApp() {
    secureStorage.delete(key: 'ff_firstUseApp');
  }

  bool _isInSearchCostomerPage = false;
  bool get isInSearchCostomerPage => _isInSearchCostomerPage;
  set isInSearchCostomerPage(bool value) {
    _isInSearchCostomerPage = value;
  }

  List<String> _listSearchCustomer = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get listSearchCustomer => _listSearchCustomer;
  set listSearchCustomer(List<String> value) {
    _listSearchCustomer = value;
  }

  void addToListSearchCustomer(String value) {
    listSearchCustomer.add(value);
  }

  void removeFromListSearchCustomer(String value) {
    listSearchCustomer.remove(value);
  }

  void removeAtIndexFromListSearchCustomer(int index) {
    listSearchCustomer.removeAt(index);
  }

  void updateListSearchCustomerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listSearchCustomer[index] = updateFn(_listSearchCustomer[index]);
  }

  void insertAtIndexInListSearchCustomer(int index, String value) {
    listSearchCustomer.insert(index, value);
  }

  List<String> _listCustomerID = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get listCustomerID => _listCustomerID;
  set listCustomerID(List<String> value) {
    _listCustomerID = value;
  }

  void addToListCustomerID(String value) {
    listCustomerID.add(value);
  }

  void removeFromListCustomerID(String value) {
    listCustomerID.remove(value);
  }

  void removeAtIndexFromListCustomerID(int index) {
    listCustomerID.removeAt(index);
  }

  void updateListCustomerIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listCustomerID[index] = updateFn(_listCustomerID[index]);
  }

  void insertAtIndexInListCustomerID(int index, String value) {
    listCustomerID.insert(index, value);
  }

  List<String> _listCustomerAddress = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get listCustomerAddress => _listCustomerAddress;
  set listCustomerAddress(List<String> value) {
    _listCustomerAddress = value;
  }

  void addToListCustomerAddress(String value) {
    listCustomerAddress.add(value);
  }

  void removeFromListCustomerAddress(String value) {
    listCustomerAddress.remove(value);
  }

  void removeAtIndexFromListCustomerAddress(int index) {
    listCustomerAddress.removeAt(index);
  }

  void updateListCustomerAddressAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listCustomerAddress[index] = updateFn(_listCustomerAddress[index]);
  }

  void insertAtIndexInListCustomerAddress(int index, String value) {
    listCustomerAddress.insert(index, value);
  }

  List<int> _listIndexOfSearch = [0, 1, 2, 3, 4];
  List<int> get listIndexOfSearch => _listIndexOfSearch;
  set listIndexOfSearch(List<int> value) {
    _listIndexOfSearch = value;
  }

  void addToListIndexOfSearch(int value) {
    listIndexOfSearch.add(value);
  }

  void removeFromListIndexOfSearch(int value) {
    listIndexOfSearch.remove(value);
  }

  void removeAtIndexFromListIndexOfSearch(int index) {
    listIndexOfSearch.removeAt(index);
  }

  void updateListIndexOfSearchAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listIndexOfSearch[index] = updateFn(_listIndexOfSearch[index]);
  }

  void insertAtIndexInListIndexOfSearch(int index, int value) {
    listIndexOfSearch.insert(index, value);
  }

  LatLng? _customerNewLo = LatLng(0, 0);
  LatLng? get customerNewLo => _customerNewLo;
  set customerNewLo(LatLng? value) {
    _customerNewLo = value;
  }

  String _pinCodeAuth = '';
  String get pinCodeAuth => _pinCodeAuth;
  set pinCodeAuth(String value) {
    _pinCodeAuth = value;
    secureStorage.setString('ff_pinCodeAuth', value);
  }

  void deletePinCodeAuth() {
    secureStorage.delete(key: 'ff_pinCodeAuth');
  }

  bool _isFromAuth = false;
  bool get isFromAuth => _isFromAuth;
  set isFromAuth(bool value) {
    _isFromAuth = value;
  }

  bool _isFromSetPin = false;
  bool get isFromSetPin => _isFromSetPin;
  set isFromSetPin(bool value) {
    _isFromSetPin = value;
  }

  bool _isFromLogin = false;
  bool get isFromLogin => _isFromLogin;
  set isFromLogin(bool value) {
    _isFromLogin = value;
  }

  bool _LoggedIn = false;
  bool get LoggedIn => _LoggedIn;
  set LoggedIn(bool value) {
    _LoggedIn = value;
    secureStorage.setBool('ff_LoggedIn', value);
  }

  void deleteLoggedIn() {
    secureStorage.delete(key: 'ff_LoggedIn');
  }

  String _ApiUrlLink = '';
  String get ApiUrlLink => _ApiUrlLink;
  set ApiUrlLink(String value) {
    _ApiUrlLink = value;
    secureStorage.setString('ff_ApiUrlLink', value);
  }

  void deleteApiUrlLink() {
    secureStorage.delete(key: 'ff_ApiUrlLink');
  }

  List<String> _leadStatus = [];
  List<String> get leadStatus => _leadStatus;
  set leadStatus(List<String> value) {
    _leadStatus = value;
  }

  void addToLeadStatus(String value) {
    leadStatus.add(value);
  }

  void removeFromLeadStatus(String value) {
    leadStatus.remove(value);
  }

  void removeAtIndexFromLeadStatus(int index) {
    leadStatus.removeAt(index);
  }

  void updateLeadStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadStatus[index] = updateFn(_leadStatus[index]);
  }

  void insertAtIndexInLeadStatus(int index, String value) {
    leadStatus.insert(index, value);
  }

  List<String> _leadReasonID = ['Hello World', 'Hello World', 'Hello World'];
  List<String> get leadReasonID => _leadReasonID;
  set leadReasonID(List<String> value) {
    _leadReasonID = value;
  }

  void addToLeadReasonID(String value) {
    leadReasonID.add(value);
  }

  void removeFromLeadReasonID(String value) {
    leadReasonID.remove(value);
  }

  void removeAtIndexFromLeadReasonID(int index) {
    leadReasonID.removeAt(index);
  }

  void updateLeadReasonIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadReasonID[index] = updateFn(_leadReasonID[index]);
  }

  void insertAtIndexInLeadReasonID(int index, String value) {
    leadReasonID.insert(index, value);
  }

  List<String> _leadReasonCode = ['Hello World', 'Hello World', 'Hello World'];
  List<String> get leadReasonCode => _leadReasonCode;
  set leadReasonCode(List<String> value) {
    _leadReasonCode = value;
  }

  void addToLeadReasonCode(String value) {
    leadReasonCode.add(value);
  }

  void removeFromLeadReasonCode(String value) {
    leadReasonCode.remove(value);
  }

  void removeAtIndexFromLeadReasonCode(int index) {
    leadReasonCode.removeAt(index);
  }

  void updateLeadReasonCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadReasonCode[index] = updateFn(_leadReasonCode[index]);
  }

  void insertAtIndexInLeadReasonCode(int index, String value) {
    leadReasonCode.insert(index, value);
  }

  List<String> _leadCallStatus = ['Hello World', 'Hello World', 'Hello World'];
  List<String> get leadCallStatus => _leadCallStatus;
  set leadCallStatus(List<String> value) {
    _leadCallStatus = value;
  }

  void addToLeadCallStatus(String value) {
    leadCallStatus.add(value);
  }

  void removeFromLeadCallStatus(String value) {
    leadCallStatus.remove(value);
  }

  void removeAtIndexFromLeadCallStatus(int index) {
    leadCallStatus.removeAt(index);
  }

  void updateLeadCallStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCallStatus[index] = updateFn(_leadCallStatus[index]);
  }

  void insertAtIndexInLeadCallStatus(int index, String value) {
    leadCallStatus.insert(index, value);
  }

  String _findCustomerInput = '';
  String get findCustomerInput => _findCustomerInput;
  set findCustomerInput(String value) {
    _findCustomerInput = value;
  }

  String _profileID = '';
  String get profileID => _profileID;
  set profileID(String value) {
    _profileID = value;
    secureStorage.setString('ff_profileID', value);
  }

  void deleteProfileID() {
    secureStorage.delete(key: 'ff_profileID');
  }

  String _agentCode = '';
  String get agentCode => _agentCode;
  set agentCode(String value) {
    _agentCode = value;
    secureStorage.setString('ff_agentCode', value);
  }

  void deleteAgentCode() {
    secureStorage.delete(key: 'ff_agentCode');
  }

  String _leadTypeCheck = 'all';
  String get leadTypeCheck => _leadTypeCheck;
  set leadTypeCheck(String value) {
    _leadTypeCheck = value;
  }

  String _searchLeadText = 'not_search';
  String get searchLeadText => _searchLeadText;
  set searchLeadText(String value) {
    _searchLeadText = value;
  }

  String _agentName = '';
  String get agentName => _agentName;
  set agentName(String value) {
    _agentName = value;
    secureStorage.setString('ff_agentName', value);
  }

  void deleteAgentName() {
    secureStorage.delete(key: 'ff_agentName');
  }

  List<String> _refIDlist = [];
  List<String> get refIDlist => _refIDlist;
  set refIDlist(List<String> value) {
    _refIDlist = value;
    secureStorage.setStringList('ff_refIDlist', value);
  }

  void deleteRefIDlist() {
    secureStorage.delete(key: 'ff_refIDlist');
  }

  void addToRefIDlist(String value) {
    refIDlist.add(value);
    secureStorage.setStringList('ff_refIDlist', _refIDlist);
  }

  void removeFromRefIDlist(String value) {
    refIDlist.remove(value);
    secureStorage.setStringList('ff_refIDlist', _refIDlist);
  }

  void removeAtIndexFromRefIDlist(int index) {
    refIDlist.removeAt(index);
    secureStorage.setStringList('ff_refIDlist', _refIDlist);
  }

  void updateRefIDlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    refIDlist[index] = updateFn(_refIDlist[index]);
    secureStorage.setStringList('ff_refIDlist', _refIDlist);
  }

  void insertAtIndexInRefIDlist(int index, String value) {
    refIDlist.insert(index, value);
    secureStorage.setStringList('ff_refIDlist', _refIDlist);
  }

  List<String> _Contractlist = [];
  List<String> get Contractlist => _Contractlist;
  set Contractlist(List<String> value) {
    _Contractlist = value;
    secureStorage.setStringList('ff_Contractlist', value);
  }

  void deleteContractlist() {
    secureStorage.delete(key: 'ff_Contractlist');
  }

  void addToContractlist(String value) {
    Contractlist.add(value);
    secureStorage.setStringList('ff_Contractlist', _Contractlist);
  }

  void removeFromContractlist(String value) {
    Contractlist.remove(value);
    secureStorage.setStringList('ff_Contractlist', _Contractlist);
  }

  void removeAtIndexFromContractlist(int index) {
    Contractlist.removeAt(index);
    secureStorage.setStringList('ff_Contractlist', _Contractlist);
  }

  void updateContractlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Contractlist[index] = updateFn(_Contractlist[index]);
    secureStorage.setStringList('ff_Contractlist', _Contractlist);
  }

  void insertAtIndexInContractlist(int index, String value) {
    Contractlist.insert(index, value);
    secureStorage.setStringList('ff_Contractlist', _Contractlist);
  }

  List<String> _ThaiID1list = [];
  List<String> get ThaiID1list => _ThaiID1list;
  set ThaiID1list(List<String> value) {
    _ThaiID1list = value;
    secureStorage.setStringList('ff_ThaiID1list', value);
  }

  void deleteThaiID1list() {
    secureStorage.delete(key: 'ff_ThaiID1list');
  }

  void addToThaiID1list(String value) {
    ThaiID1list.add(value);
    secureStorage.setStringList('ff_ThaiID1list', _ThaiID1list);
  }

  void removeFromThaiID1list(String value) {
    ThaiID1list.remove(value);
    secureStorage.setStringList('ff_ThaiID1list', _ThaiID1list);
  }

  void removeAtIndexFromThaiID1list(int index) {
    ThaiID1list.removeAt(index);
    secureStorage.setStringList('ff_ThaiID1list', _ThaiID1list);
  }

  void updateThaiID1listAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ThaiID1list[index] = updateFn(_ThaiID1list[index]);
    secureStorage.setStringList('ff_ThaiID1list', _ThaiID1list);
  }

  void insertAtIndexInThaiID1list(int index, String value) {
    ThaiID1list.insert(index, value);
    secureStorage.setStringList('ff_ThaiID1list', _ThaiID1list);
  }

  List<String> _CustomerNamelist = [];
  List<String> get CustomerNamelist => _CustomerNamelist;
  set CustomerNamelist(List<String> value) {
    _CustomerNamelist = value;
    secureStorage.setStringList('ff_CustomerNamelist', value);
  }

  void deleteCustomerNamelist() {
    secureStorage.delete(key: 'ff_CustomerNamelist');
  }

  void addToCustomerNamelist(String value) {
    CustomerNamelist.add(value);
    secureStorage.setStringList('ff_CustomerNamelist', _CustomerNamelist);
  }

  void removeFromCustomerNamelist(String value) {
    CustomerNamelist.remove(value);
    secureStorage.setStringList('ff_CustomerNamelist', _CustomerNamelist);
  }

  void removeAtIndexFromCustomerNamelist(int index) {
    CustomerNamelist.removeAt(index);
    secureStorage.setStringList('ff_CustomerNamelist', _CustomerNamelist);
  }

  void updateCustomerNamelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    CustomerNamelist[index] = updateFn(_CustomerNamelist[index]);
    secureStorage.setStringList('ff_CustomerNamelist', _CustomerNamelist);
  }

  void insertAtIndexInCustomerNamelist(int index, String value) {
    CustomerNamelist.insert(index, value);
    secureStorage.setStringList('ff_CustomerNamelist', _CustomerNamelist);
  }

  List<String> _Addresslist = [];
  List<String> get Addresslist => _Addresslist;
  set Addresslist(List<String> value) {
    _Addresslist = value;
    secureStorage.setStringList('ff_Addresslist', value);
  }

  void deleteAddresslist() {
    secureStorage.delete(key: 'ff_Addresslist');
  }

  void addToAddresslist(String value) {
    Addresslist.add(value);
    secureStorage.setStringList('ff_Addresslist', _Addresslist);
  }

  void removeFromAddresslist(String value) {
    Addresslist.remove(value);
    secureStorage.setStringList('ff_Addresslist', _Addresslist);
  }

  void removeAtIndexFromAddresslist(int index) {
    Addresslist.removeAt(index);
    secureStorage.setStringList('ff_Addresslist', _Addresslist);
  }

  void updateAddresslistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Addresslist[index] = updateFn(_Addresslist[index]);
    secureStorage.setStringList('ff_Addresslist', _Addresslist);
  }

  void insertAtIndexInAddresslist(int index, String value) {
    Addresslist.insert(index, value);
    secureStorage.setStringList('ff_Addresslist', _Addresslist);
  }

  List<String> _Districtlist = [];
  List<String> get Districtlist => _Districtlist;
  set Districtlist(List<String> value) {
    _Districtlist = value;
    secureStorage.setStringList('ff_Districtlist', value);
  }

  void deleteDistrictlist() {
    secureStorage.delete(key: 'ff_Districtlist');
  }

  void addToDistrictlist(String value) {
    Districtlist.add(value);
    secureStorage.setStringList('ff_Districtlist', _Districtlist);
  }

  void removeFromDistrictlist(String value) {
    Districtlist.remove(value);
    secureStorage.setStringList('ff_Districtlist', _Districtlist);
  }

  void removeAtIndexFromDistrictlist(int index) {
    Districtlist.removeAt(index);
    secureStorage.setStringList('ff_Districtlist', _Districtlist);
  }

  void updateDistrictlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Districtlist[index] = updateFn(_Districtlist[index]);
    secureStorage.setStringList('ff_Districtlist', _Districtlist);
  }

  void insertAtIndexInDistrictlist(int index, String value) {
    Districtlist.insert(index, value);
    secureStorage.setStringList('ff_Districtlist', _Districtlist);
  }

  List<String> _Provincelist = [];
  List<String> get Provincelist => _Provincelist;
  set Provincelist(List<String> value) {
    _Provincelist = value;
    secureStorage.setStringList('ff_Provincelist', value);
  }

  void deleteProvincelist() {
    secureStorage.delete(key: 'ff_Provincelist');
  }

  void addToProvincelist(String value) {
    Provincelist.add(value);
    secureStorage.setStringList('ff_Provincelist', _Provincelist);
  }

  void removeFromProvincelist(String value) {
    Provincelist.remove(value);
    secureStorage.setStringList('ff_Provincelist', _Provincelist);
  }

  void removeAtIndexFromProvincelist(int index) {
    Provincelist.removeAt(index);
    secureStorage.setStringList('ff_Provincelist', _Provincelist);
  }

  void updateProvincelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Provincelist[index] = updateFn(_Provincelist[index]);
    secureStorage.setStringList('ff_Provincelist', _Provincelist);
  }

  void insertAtIndexInProvincelist(int index, String value) {
    Provincelist.insert(index, value);
    secureStorage.setStringList('ff_Provincelist', _Provincelist);
  }

  List<String> _ZipCodelist = [];
  List<String> get ZipCodelist => _ZipCodelist;
  set ZipCodelist(List<String> value) {
    _ZipCodelist = value;
    secureStorage.setStringList('ff_ZipCodelist', value);
  }

  void deleteZipCodelist() {
    secureStorage.delete(key: 'ff_ZipCodelist');
  }

  void addToZipCodelist(String value) {
    ZipCodelist.add(value);
    secureStorage.setStringList('ff_ZipCodelist', _ZipCodelist);
  }

  void removeFromZipCodelist(String value) {
    ZipCodelist.remove(value);
    secureStorage.setStringList('ff_ZipCodelist', _ZipCodelist);
  }

  void removeAtIndexFromZipCodelist(int index) {
    ZipCodelist.removeAt(index);
    secureStorage.setStringList('ff_ZipCodelist', _ZipCodelist);
  }

  void updateZipCodelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ZipCodelist[index] = updateFn(_ZipCodelist[index]);
    secureStorage.setStringList('ff_ZipCodelist', _ZipCodelist);
  }

  void insertAtIndexInZipCodelist(int index, String value) {
    ZipCodelist.insert(index, value);
    secureStorage.setStringList('ff_ZipCodelist', _ZipCodelist);
  }

  List<String> _Telephonelist = [];
  List<String> get Telephonelist => _Telephonelist;
  set Telephonelist(List<String> value) {
    _Telephonelist = value;
    secureStorage.setStringList('ff_Telephonelist', value);
  }

  void deleteTelephonelist() {
    secureStorage.delete(key: 'ff_Telephonelist');
  }

  void addToTelephonelist(String value) {
    Telephonelist.add(value);
    secureStorage.setStringList('ff_Telephonelist', _Telephonelist);
  }

  void removeFromTelephonelist(String value) {
    Telephonelist.remove(value);
    secureStorage.setStringList('ff_Telephonelist', _Telephonelist);
  }

  void removeAtIndexFromTelephonelist(int index) {
    Telephonelist.removeAt(index);
    secureStorage.setStringList('ff_Telephonelist', _Telephonelist);
  }

  void updateTelephonelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Telephonelist[index] = updateFn(_Telephonelist[index]);
    secureStorage.setStringList('ff_Telephonelist', _Telephonelist);
  }

  void insertAtIndexInTelephonelist(int index, String value) {
    Telephonelist.insert(index, value);
    secureStorage.setStringList('ff_Telephonelist', _Telephonelist);
  }

  List<String> _CarBrandlist = [];
  List<String> get CarBrandlist => _CarBrandlist;
  set CarBrandlist(List<String> value) {
    _CarBrandlist = value;
    secureStorage.setStringList('ff_CarBrandlist', value);
  }

  void deleteCarBrandlist() {
    secureStorage.delete(key: 'ff_CarBrandlist');
  }

  void addToCarBrandlist(String value) {
    CarBrandlist.add(value);
    secureStorage.setStringList('ff_CarBrandlist', _CarBrandlist);
  }

  void removeFromCarBrandlist(String value) {
    CarBrandlist.remove(value);
    secureStorage.setStringList('ff_CarBrandlist', _CarBrandlist);
  }

  void removeAtIndexFromCarBrandlist(int index) {
    CarBrandlist.removeAt(index);
    secureStorage.setStringList('ff_CarBrandlist', _CarBrandlist);
  }

  void updateCarBrandlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    CarBrandlist[index] = updateFn(_CarBrandlist[index]);
    secureStorage.setStringList('ff_CarBrandlist', _CarBrandlist);
  }

  void insertAtIndexInCarBrandlist(int index, String value) {
    CarBrandlist.insert(index, value);
    secureStorage.setStringList('ff_CarBrandlist', _CarBrandlist);
  }

  List<String> _Colorlist = [];
  List<String> get Colorlist => _Colorlist;
  set Colorlist(List<String> value) {
    _Colorlist = value;
    secureStorage.setStringList('ff_Colorlist', value);
  }

  void deleteColorlist() {
    secureStorage.delete(key: 'ff_Colorlist');
  }

  void addToColorlist(String value) {
    Colorlist.add(value);
    secureStorage.setStringList('ff_Colorlist', _Colorlist);
  }

  void removeFromColorlist(String value) {
    Colorlist.remove(value);
    secureStorage.setStringList('ff_Colorlist', _Colorlist);
  }

  void removeAtIndexFromColorlist(int index) {
    Colorlist.removeAt(index);
    secureStorage.setStringList('ff_Colorlist', _Colorlist);
  }

  void updateColorlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Colorlist[index] = updateFn(_Colorlist[index]);
    secureStorage.setStringList('ff_Colorlist', _Colorlist);
  }

  void insertAtIndexInColorlist(int index, String value) {
    Colorlist.insert(index, value);
    secureStorage.setStringList('ff_Colorlist', _Colorlist);
  }

  List<String> _Surveyorlist = [];
  List<String> get Surveyorlist => _Surveyorlist;
  set Surveyorlist(List<String> value) {
    _Surveyorlist = value;
    secureStorage.setStringList('ff_Surveyorlist', value);
  }

  void deleteSurveyorlist() {
    secureStorage.delete(key: 'ff_Surveyorlist');
  }

  void addToSurveyorlist(String value) {
    Surveyorlist.add(value);
    secureStorage.setStringList('ff_Surveyorlist', _Surveyorlist);
  }

  void removeFromSurveyorlist(String value) {
    Surveyorlist.remove(value);
    secureStorage.setStringList('ff_Surveyorlist', _Surveyorlist);
  }

  void removeAtIndexFromSurveyorlist(int index) {
    Surveyorlist.removeAt(index);
    secureStorage.setStringList('ff_Surveyorlist', _Surveyorlist);
  }

  void updateSurveyorlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Surveyorlist[index] = updateFn(_Surveyorlist[index]);
    secureStorage.setStringList('ff_Surveyorlist', _Surveyorlist);
  }

  void insertAtIndexInSurveyorlist(int index, String value) {
    Surveyorlist.insert(index, value);
    secureStorage.setStringList('ff_Surveyorlist', _Surveyorlist);
  }

  List<String> _StatusPinPointlist = [];
  List<String> get StatusPinPointlist => _StatusPinPointlist;
  set StatusPinPointlist(List<String> value) {
    _StatusPinPointlist = value;
    secureStorage.setStringList('ff_StatusPinPointlist', value);
  }

  void deleteStatusPinPointlist() {
    secureStorage.delete(key: 'ff_StatusPinPointlist');
  }

  void addToStatusPinPointlist(String value) {
    StatusPinPointlist.add(value);
    secureStorage.setStringList('ff_StatusPinPointlist', _StatusPinPointlist);
  }

  void removeFromStatusPinPointlist(String value) {
    StatusPinPointlist.remove(value);
    secureStorage.setStringList('ff_StatusPinPointlist', _StatusPinPointlist);
  }

  void removeAtIndexFromStatusPinPointlist(int index) {
    StatusPinPointlist.removeAt(index);
    secureStorage.setStringList('ff_StatusPinPointlist', _StatusPinPointlist);
  }

  void updateStatusPinPointlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    StatusPinPointlist[index] = updateFn(_StatusPinPointlist[index]);
    secureStorage.setStringList('ff_StatusPinPointlist', _StatusPinPointlist);
  }

  void insertAtIndexInStatusPinPointlist(int index, String value) {
    StatusPinPointlist.insert(index, value);
    secureStorage.setStringList('ff_StatusPinPointlist', _StatusPinPointlist);
  }

  bool _callPinpoint = false;
  bool get callPinpoint => _callPinpoint;
  set callPinpoint(bool value) {
    _callPinpoint = value;
    secureStorage.setBool('ff_callPinpoint', value);
  }

  void deleteCallPinpoint() {
    secureStorage.delete(key: 'ff_callPinpoint');
  }

  List<String> _customerNamePending = [];
  List<String> get customerNamePending => _customerNamePending;
  set customerNamePending(List<String> value) {
    _customerNamePending = value;
    secureStorage.setStringList('ff_customerNamePending', value);
  }

  void deleteCustomerNamePending() {
    secureStorage.delete(key: 'ff_customerNamePending');
  }

  void addToCustomerNamePending(String value) {
    customerNamePending.add(value);
    secureStorage.setStringList('ff_customerNamePending', _customerNamePending);
  }

  void removeFromCustomerNamePending(String value) {
    customerNamePending.remove(value);
    secureStorage.setStringList('ff_customerNamePending', _customerNamePending);
  }

  void removeAtIndexFromCustomerNamePending(int index) {
    customerNamePending.removeAt(index);
    secureStorage.setStringList('ff_customerNamePending', _customerNamePending);
  }

  void updateCustomerNamePendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    customerNamePending[index] = updateFn(_customerNamePending[index]);
    secureStorage.setStringList('ff_customerNamePending', _customerNamePending);
  }

  void insertAtIndexInCustomerNamePending(int index, String value) {
    customerNamePending.insert(index, value);
    secureStorage.setStringList('ff_customerNamePending', _customerNamePending);
  }

  List<String> _thaiIDPending = [];
  List<String> get thaiIDPending => _thaiIDPending;
  set thaiIDPending(List<String> value) {
    _thaiIDPending = value;
    secureStorage.setStringList('ff_thaiIDPending', value);
  }

  void deleteThaiIDPending() {
    secureStorage.delete(key: 'ff_thaiIDPending');
  }

  void addToThaiIDPending(String value) {
    thaiIDPending.add(value);
    secureStorage.setStringList('ff_thaiIDPending', _thaiIDPending);
  }

  void removeFromThaiIDPending(String value) {
    thaiIDPending.remove(value);
    secureStorage.setStringList('ff_thaiIDPending', _thaiIDPending);
  }

  void removeAtIndexFromThaiIDPending(int index) {
    thaiIDPending.removeAt(index);
    secureStorage.setStringList('ff_thaiIDPending', _thaiIDPending);
  }

  void updateThaiIDPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    thaiIDPending[index] = updateFn(_thaiIDPending[index]);
    secureStorage.setStringList('ff_thaiIDPending', _thaiIDPending);
  }

  void insertAtIndexInThaiIDPending(int index, String value) {
    thaiIDPending.insert(index, value);
    secureStorage.setStringList('ff_thaiIDPending', _thaiIDPending);
  }

  List<String> _contractPending = [];
  List<String> get contractPending => _contractPending;
  set contractPending(List<String> value) {
    _contractPending = value;
    secureStorage.setStringList('ff_contractPending', value);
  }

  void deleteContractPending() {
    secureStorage.delete(key: 'ff_contractPending');
  }

  void addToContractPending(String value) {
    contractPending.add(value);
    secureStorage.setStringList('ff_contractPending', _contractPending);
  }

  void removeFromContractPending(String value) {
    contractPending.remove(value);
    secureStorage.setStringList('ff_contractPending', _contractPending);
  }

  void removeAtIndexFromContractPending(int index) {
    contractPending.removeAt(index);
    secureStorage.setStringList('ff_contractPending', _contractPending);
  }

  void updateContractPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    contractPending[index] = updateFn(_contractPending[index]);
    secureStorage.setStringList('ff_contractPending', _contractPending);
  }

  void insertAtIndexInContractPending(int index, String value) {
    contractPending.insert(index, value);
    secureStorage.setStringList('ff_contractPending', _contractPending);
  }

  List<String> _addressPending = [];
  List<String> get addressPending => _addressPending;
  set addressPending(List<String> value) {
    _addressPending = value;
    secureStorage.setStringList('ff_addressPending', value);
  }

  void deleteAddressPending() {
    secureStorage.delete(key: 'ff_addressPending');
  }

  void addToAddressPending(String value) {
    addressPending.add(value);
    secureStorage.setStringList('ff_addressPending', _addressPending);
  }

  void removeFromAddressPending(String value) {
    addressPending.remove(value);
    secureStorage.setStringList('ff_addressPending', _addressPending);
  }

  void removeAtIndexFromAddressPending(int index) {
    addressPending.removeAt(index);
    secureStorage.setStringList('ff_addressPending', _addressPending);
  }

  void updateAddressPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addressPending[index] = updateFn(_addressPending[index]);
    secureStorage.setStringList('ff_addressPending', _addressPending);
  }

  void insertAtIndexInAddressPending(int index, String value) {
    addressPending.insert(index, value);
    secureStorage.setStringList('ff_addressPending', _addressPending);
  }

  List<String> _districtPending = [];
  List<String> get districtPending => _districtPending;
  set districtPending(List<String> value) {
    _districtPending = value;
    secureStorage.setStringList('ff_districtPending', value);
  }

  void deleteDistrictPending() {
    secureStorage.delete(key: 'ff_districtPending');
  }

  void addToDistrictPending(String value) {
    districtPending.add(value);
    secureStorage.setStringList('ff_districtPending', _districtPending);
  }

  void removeFromDistrictPending(String value) {
    districtPending.remove(value);
    secureStorage.setStringList('ff_districtPending', _districtPending);
  }

  void removeAtIndexFromDistrictPending(int index) {
    districtPending.removeAt(index);
    secureStorage.setStringList('ff_districtPending', _districtPending);
  }

  void updateDistrictPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    districtPending[index] = updateFn(_districtPending[index]);
    secureStorage.setStringList('ff_districtPending', _districtPending);
  }

  void insertAtIndexInDistrictPending(int index, String value) {
    districtPending.insert(index, value);
    secureStorage.setStringList('ff_districtPending', _districtPending);
  }

  List<String> _provincePending = [];
  List<String> get provincePending => _provincePending;
  set provincePending(List<String> value) {
    _provincePending = value;
    secureStorage.setStringList('ff_provincePending', value);
  }

  void deleteProvincePending() {
    secureStorage.delete(key: 'ff_provincePending');
  }

  void addToProvincePending(String value) {
    provincePending.add(value);
    secureStorage.setStringList('ff_provincePending', _provincePending);
  }

  void removeFromProvincePending(String value) {
    provincePending.remove(value);
    secureStorage.setStringList('ff_provincePending', _provincePending);
  }

  void removeAtIndexFromProvincePending(int index) {
    provincePending.removeAt(index);
    secureStorage.setStringList('ff_provincePending', _provincePending);
  }

  void updateProvincePendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    provincePending[index] = updateFn(_provincePending[index]);
    secureStorage.setStringList('ff_provincePending', _provincePending);
  }

  void insertAtIndexInProvincePending(int index, String value) {
    provincePending.insert(index, value);
    secureStorage.setStringList('ff_provincePending', _provincePending);
  }

  List<String> _postCodePending = [];
  List<String> get postCodePending => _postCodePending;
  set postCodePending(List<String> value) {
    _postCodePending = value;
    secureStorage.setStringList('ff_postCodePending', value);
  }

  void deletePostCodePending() {
    secureStorage.delete(key: 'ff_postCodePending');
  }

  void addToPostCodePending(String value) {
    postCodePending.add(value);
    secureStorage.setStringList('ff_postCodePending', _postCodePending);
  }

  void removeFromPostCodePending(String value) {
    postCodePending.remove(value);
    secureStorage.setStringList('ff_postCodePending', _postCodePending);
  }

  void removeAtIndexFromPostCodePending(int index) {
    postCodePending.removeAt(index);
    secureStorage.setStringList('ff_postCodePending', _postCodePending);
  }

  void updatePostCodePendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    postCodePending[index] = updateFn(_postCodePending[index]);
    secureStorage.setStringList('ff_postCodePending', _postCodePending);
  }

  void insertAtIndexInPostCodePending(int index, String value) {
    postCodePending.insert(index, value);
    secureStorage.setStringList('ff_postCodePending', _postCodePending);
  }

  List<String> _phoneNumberPending = [];
  List<String> get phoneNumberPending => _phoneNumberPending;
  set phoneNumberPending(List<String> value) {
    _phoneNumberPending = value;
    secureStorage.setStringList('ff_phoneNumberPending', value);
  }

  void deletePhoneNumberPending() {
    secureStorage.delete(key: 'ff_phoneNumberPending');
  }

  void addToPhoneNumberPending(String value) {
    phoneNumberPending.add(value);
    secureStorage.setStringList('ff_phoneNumberPending', _phoneNumberPending);
  }

  void removeFromPhoneNumberPending(String value) {
    phoneNumberPending.remove(value);
    secureStorage.setStringList('ff_phoneNumberPending', _phoneNumberPending);
  }

  void removeAtIndexFromPhoneNumberPending(int index) {
    phoneNumberPending.removeAt(index);
    secureStorage.setStringList('ff_phoneNumberPending', _phoneNumberPending);
  }

  void updatePhoneNumberPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    phoneNumberPending[index] = updateFn(_phoneNumberPending[index]);
    secureStorage.setStringList('ff_phoneNumberPending', _phoneNumberPending);
  }

  void insertAtIndexInPhoneNumberPending(int index, String value) {
    phoneNumberPending.insert(index, value);
    secureStorage.setStringList('ff_phoneNumberPending', _phoneNumberPending);
  }

  List<String> _carbrandPending = [];
  List<String> get carbrandPending => _carbrandPending;
  set carbrandPending(List<String> value) {
    _carbrandPending = value;
    secureStorage.setStringList('ff_carbrandPending', value);
  }

  void deleteCarbrandPending() {
    secureStorage.delete(key: 'ff_carbrandPending');
  }

  void addToCarbrandPending(String value) {
    carbrandPending.add(value);
    secureStorage.setStringList('ff_carbrandPending', _carbrandPending);
  }

  void removeFromCarbrandPending(String value) {
    carbrandPending.remove(value);
    secureStorage.setStringList('ff_carbrandPending', _carbrandPending);
  }

  void removeAtIndexFromCarbrandPending(int index) {
    carbrandPending.removeAt(index);
    secureStorage.setStringList('ff_carbrandPending', _carbrandPending);
  }

  void updateCarbrandPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    carbrandPending[index] = updateFn(_carbrandPending[index]);
    secureStorage.setStringList('ff_carbrandPending', _carbrandPending);
  }

  void insertAtIndexInCarbrandPending(int index, String value) {
    carbrandPending.insert(index, value);
    secureStorage.setStringList('ff_carbrandPending', _carbrandPending);
  }

  List<String> _carcolorPending = [];
  List<String> get carcolorPending => _carcolorPending;
  set carcolorPending(List<String> value) {
    _carcolorPending = value;
    secureStorage.setStringList('ff_carcolorPending', value);
  }

  void deleteCarcolorPending() {
    secureStorage.delete(key: 'ff_carcolorPending');
  }

  void addToCarcolorPending(String value) {
    carcolorPending.add(value);
    secureStorage.setStringList('ff_carcolorPending', _carcolorPending);
  }

  void removeFromCarcolorPending(String value) {
    carcolorPending.remove(value);
    secureStorage.setStringList('ff_carcolorPending', _carcolorPending);
  }

  void removeAtIndexFromCarcolorPending(int index) {
    carcolorPending.removeAt(index);
    secureStorage.setStringList('ff_carcolorPending', _carcolorPending);
  }

  void updateCarcolorPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    carcolorPending[index] = updateFn(_carcolorPending[index]);
    secureStorage.setStringList('ff_carcolorPending', _carcolorPending);
  }

  void insertAtIndexInCarcolorPending(int index, String value) {
    carcolorPending.insert(index, value);
    secureStorage.setStringList('ff_carcolorPending', _carcolorPending);
  }

  List<String> _ans1Pending = [];
  List<String> get ans1Pending => _ans1Pending;
  set ans1Pending(List<String> value) {
    _ans1Pending = value;
    secureStorage.setStringList('ff_ans1Pending', value);
  }

  void deleteAns1Pending() {
    secureStorage.delete(key: 'ff_ans1Pending');
  }

  void addToAns1Pending(String value) {
    ans1Pending.add(value);
    secureStorage.setStringList('ff_ans1Pending', _ans1Pending);
  }

  void removeFromAns1Pending(String value) {
    ans1Pending.remove(value);
    secureStorage.setStringList('ff_ans1Pending', _ans1Pending);
  }

  void removeAtIndexFromAns1Pending(int index) {
    ans1Pending.removeAt(index);
    secureStorage.setStringList('ff_ans1Pending', _ans1Pending);
  }

  void updateAns1PendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ans1Pending[index] = updateFn(_ans1Pending[index]);
    secureStorage.setStringList('ff_ans1Pending', _ans1Pending);
  }

  void insertAtIndexInAns1Pending(int index, String value) {
    ans1Pending.insert(index, value);
    secureStorage.setStringList('ff_ans1Pending', _ans1Pending);
  }

  List<String> _ans2Pending = [];
  List<String> get ans2Pending => _ans2Pending;
  set ans2Pending(List<String> value) {
    _ans2Pending = value;
    secureStorage.setStringList('ff_ans2Pending', value);
  }

  void deleteAns2Pending() {
    secureStorage.delete(key: 'ff_ans2Pending');
  }

  void addToAns2Pending(String value) {
    ans2Pending.add(value);
    secureStorage.setStringList('ff_ans2Pending', _ans2Pending);
  }

  void removeFromAns2Pending(String value) {
    ans2Pending.remove(value);
    secureStorage.setStringList('ff_ans2Pending', _ans2Pending);
  }

  void removeAtIndexFromAns2Pending(int index) {
    ans2Pending.removeAt(index);
    secureStorage.setStringList('ff_ans2Pending', _ans2Pending);
  }

  void updateAns2PendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ans2Pending[index] = updateFn(_ans2Pending[index]);
    secureStorage.setStringList('ff_ans2Pending', _ans2Pending);
  }

  void insertAtIndexInAns2Pending(int index, String value) {
    ans2Pending.insert(index, value);
    secureStorage.setStringList('ff_ans2Pending', _ans2Pending);
  }

  List<String> _dropbox1Pending = [];
  List<String> get dropbox1Pending => _dropbox1Pending;
  set dropbox1Pending(List<String> value) {
    _dropbox1Pending = value;
    secureStorage.setStringList('ff_dropbox1Pending', value);
  }

  void deleteDropbox1Pending() {
    secureStorage.delete(key: 'ff_dropbox1Pending');
  }

  void addToDropbox1Pending(String value) {
    dropbox1Pending.add(value);
    secureStorage.setStringList('ff_dropbox1Pending', _dropbox1Pending);
  }

  void removeFromDropbox1Pending(String value) {
    dropbox1Pending.remove(value);
    secureStorage.setStringList('ff_dropbox1Pending', _dropbox1Pending);
  }

  void removeAtIndexFromDropbox1Pending(int index) {
    dropbox1Pending.removeAt(index);
    secureStorage.setStringList('ff_dropbox1Pending', _dropbox1Pending);
  }

  void updateDropbox1PendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dropbox1Pending[index] = updateFn(_dropbox1Pending[index]);
    secureStorage.setStringList('ff_dropbox1Pending', _dropbox1Pending);
  }

  void insertAtIndexInDropbox1Pending(int index, String value) {
    dropbox1Pending.insert(index, value);
    secureStorage.setStringList('ff_dropbox1Pending', _dropbox1Pending);
  }

  List<String> _dropbox2Pending = [];
  List<String> get dropbox2Pending => _dropbox2Pending;
  set dropbox2Pending(List<String> value) {
    _dropbox2Pending = value;
    secureStorage.setStringList('ff_dropbox2Pending', value);
  }

  void deleteDropbox2Pending() {
    secureStorage.delete(key: 'ff_dropbox2Pending');
  }

  void addToDropbox2Pending(String value) {
    dropbox2Pending.add(value);
    secureStorage.setStringList('ff_dropbox2Pending', _dropbox2Pending);
  }

  void removeFromDropbox2Pending(String value) {
    dropbox2Pending.remove(value);
    secureStorage.setStringList('ff_dropbox2Pending', _dropbox2Pending);
  }

  void removeAtIndexFromDropbox2Pending(int index) {
    dropbox2Pending.removeAt(index);
    secureStorage.setStringList('ff_dropbox2Pending', _dropbox2Pending);
  }

  void updateDropbox2PendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dropbox2Pending[index] = updateFn(_dropbox2Pending[index]);
    secureStorage.setStringList('ff_dropbox2Pending', _dropbox2Pending);
  }

  void insertAtIndexInDropbox2Pending(int index, String value) {
    dropbox2Pending.insert(index, value);
    secureStorage.setStringList('ff_dropbox2Pending', _dropbox2Pending);
  }

  List<String> _dropbox3Pending = [];
  List<String> get dropbox3Pending => _dropbox3Pending;
  set dropbox3Pending(List<String> value) {
    _dropbox3Pending = value;
    secureStorage.setStringList('ff_dropbox3Pending', value);
  }

  void deleteDropbox3Pending() {
    secureStorage.delete(key: 'ff_dropbox3Pending');
  }

  void addToDropbox3Pending(String value) {
    dropbox3Pending.add(value);
    secureStorage.setStringList('ff_dropbox3Pending', _dropbox3Pending);
  }

  void removeFromDropbox3Pending(String value) {
    dropbox3Pending.remove(value);
    secureStorage.setStringList('ff_dropbox3Pending', _dropbox3Pending);
  }

  void removeAtIndexFromDropbox3Pending(int index) {
    dropbox3Pending.removeAt(index);
    secureStorage.setStringList('ff_dropbox3Pending', _dropbox3Pending);
  }

  void updateDropbox3PendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dropbox3Pending[index] = updateFn(_dropbox3Pending[index]);
    secureStorage.setStringList('ff_dropbox3Pending', _dropbox3Pending);
  }

  void insertAtIndexInDropbox3Pending(int index, String value) {
    dropbox3Pending.insert(index, value);
    secureStorage.setStringList('ff_dropbox3Pending', _dropbox3Pending);
  }

  List<String> _refIDPending = [];
  List<String> get refIDPending => _refIDPending;
  set refIDPending(List<String> value) {
    _refIDPending = value;
    secureStorage.setStringList('ff_refIDPending', value);
  }

  void deleteRefIDPending() {
    secureStorage.delete(key: 'ff_refIDPending');
  }

  void addToRefIDPending(String value) {
    refIDPending.add(value);
    secureStorage.setStringList('ff_refIDPending', _refIDPending);
  }

  void removeFromRefIDPending(String value) {
    refIDPending.remove(value);
    secureStorage.setStringList('ff_refIDPending', _refIDPending);
  }

  void removeAtIndexFromRefIDPending(int index) {
    refIDPending.removeAt(index);
    secureStorage.setStringList('ff_refIDPending', _refIDPending);
  }

  void updateRefIDPendingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    refIDPending[index] = updateFn(_refIDPending[index]);
    secureStorage.setStringList('ff_refIDPending', _refIDPending);
  }

  void insertAtIndexInRefIDPending(int index, String value) {
    refIDPending.insert(index, value);
    secureStorage.setStringList('ff_refIDPending', _refIDPending);
  }

  List<LatLng> _latlngPending = [];
  List<LatLng> get latlngPending => _latlngPending;
  set latlngPending(List<LatLng> value) {
    _latlngPending = value;
    secureStorage.setStringList(
        'ff_latlngPending', value.map((x) => x.serialize()).toList());
  }

  void deleteLatlngPending() {
    secureStorage.delete(key: 'ff_latlngPending');
  }

  void addToLatlngPending(LatLng value) {
    latlngPending.add(value);
    secureStorage.setStringList(
        'ff_latlngPending', _latlngPending.map((x) => x.serialize()).toList());
  }

  void removeFromLatlngPending(LatLng value) {
    latlngPending.remove(value);
    secureStorage.setStringList(
        'ff_latlngPending', _latlngPending.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLatlngPending(int index) {
    latlngPending.removeAt(index);
    secureStorage.setStringList(
        'ff_latlngPending', _latlngPending.map((x) => x.serialize()).toList());
  }

  void updateLatlngPendingAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    latlngPending[index] = updateFn(_latlngPending[index]);
    secureStorage.setStringList(
        'ff_latlngPending', _latlngPending.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLatlngPending(int index, LatLng value) {
    latlngPending.insert(index, value);
    secureStorage.setStringList(
        'ff_latlngPending', _latlngPending.map((x) => x.serialize()).toList());
  }

  bool _uploadedPic1 = false;
  bool get uploadedPic1 => _uploadedPic1;
  set uploadedPic1(bool value) {
    _uploadedPic1 = value;
  }

  bool _upLoadedPic2 = false;
  bool get upLoadedPic2 => _upLoadedPic2;
  set upLoadedPic2(bool value) {
    _upLoadedPic2 = value;
  }

  bool _upLoadPic3 = false;
  bool get upLoadPic3 => _upLoadPic3;
  set upLoadPic3(bool value) {
    _upLoadPic3 = value;
  }

  bool _upLoadPic4 = false;
  bool get upLoadPic4 => _upLoadPic4;
  set upLoadPic4(bool value) {
    _upLoadPic4 = value;
  }

  bool _upLoadPic5 = false;
  bool get upLoadPic5 => _upLoadPic5;
  set upLoadPic5(bool value) {
    _upLoadPic5 = value;
  }

  bool _upLoadPic6 = false;
  bool get upLoadPic6 => _upLoadPic6;
  set upLoadPic6(bool value) {
    _upLoadPic6 = value;
  }

  bool _upLoadPic7 = false;
  bool get upLoadPic7 => _upLoadPic7;
  set upLoadPic7(bool value) {
    _upLoadPic7 = value;
  }

  bool _upLoadPic8 = false;
  bool get upLoadPic8 => _upLoadPic8;
  set upLoadPic8(bool value) {
    _upLoadPic8 = value;
  }

  int _updateLocationCount = 0;
  int get updateLocationCount => _updateLocationCount;
  set updateLocationCount(int value) {
    _updateLocationCount = value;
  }

  DocumentReference? _checkRateMunuDocRef =
      FirebaseFirestore.instance.doc('/CheckRateMenu/6FFBGubAFSv8OYSfJTj3');
  DocumentReference? get checkRateMunuDocRef => _checkRateMunuDocRef;
  set checkRateMunuDocRef(DocumentReference? value) {
    _checkRateMunuDocRef = value;
  }

  DocumentReference? _agentDataDocRef =
      FirebaseFirestore.instance.doc('/AgentData/cY3FJFHgsRp6OG2uyLtJ');
  DocumentReference? get agentDataDocRef => _agentDataDocRef;
  set agentDataDocRef(DocumentReference? value) {
    _agentDataDocRef = value;
  }

  AgentDataModelStruct _agentData = AgentDataModelStruct.fromSerializableMap(
      jsonDecode(
          '{\"agent_code\":\"[\\\"Hello World\\\"]\",\"agent_name\":\"[\\\"Hello World\\\"]\",\"agent_short_name\":\"[\\\"Hello World\\\"]\"}'));
  AgentDataModelStruct get agentData => _agentData;
  set agentData(AgentDataModelStruct value) {
    _agentData = value;
  }

  void updateAgentDataStruct(Function(AgentDataModelStruct) updateFn) {
    updateFn(_agentData);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
