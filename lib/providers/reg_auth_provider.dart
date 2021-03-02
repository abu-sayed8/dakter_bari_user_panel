import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:users_panel/model/patient_model.dart';

class RegAuth extends ChangeNotifier {

  PatientDetailsModel _patientDetails = PatientDetailsModel();
  bool _agreeChk = false;
  bool _obscure = true;
  bool _isLoading = false;
  String _loadingMgs;
  String _verificationCode;

  get patientDetails => _patientDetails;

  get agreeChk => _agreeChk;

  get obscure => _obscure;

  get isLoading => _isLoading;

  get loadingMgs => _loadingMgs;

  get verificationCode => _verificationCode;

  set patientDetails(PatientDetailsModel model) {
    model = PatientDetailsModel();
    _patientDetails = model;
    notifyListeners();
  }

  set agreeChk(bool val) {
    _agreeChk = val;
    notifyListeners();
  }

  set obscure(bool val) {
    _obscure = val;
    notifyListeners();
  }

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  set loadingMgs(String val) {
    _loadingMgs = val;
    notifyListeners();
  }

  set verificationCode(String val) {
    _verificationCode = val;
    notifyListeners();
  }


  Future<String> getPreferenceData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('id');
  }

  Future<bool> isPatientRegistered(String id) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'Patients')
        .where('id', isEqualTo: id).get();
    final List<QueryDocumentSnapshot> user = snapshot.docs;
    if (user.isEmpty) {
      //isLoading=false;
      loadingMgs = "";
      return false;
    } else {
      //isLoading=false;
      loadingMgs = "";
      return true;
    }
  }

  ///verify password
  // Future<bool> verifyPassword(String password)async{
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Doctors')
  //       .where('password', isEqualTo: password).get();
  //   final List<QueryDocumentSnapshot> user = snapshot.docs;
  //   if(user.isEmpty){
  //     isLoading=false;
  //     loadingMgs ="";
  //     return false;
  //   }else{
  //     isLoading=false;
  //     loadingMgs ="";
  //     return true;
  //   }
  // }
  ///register user

  Future<bool> registerUser(PatientDetailsModel patientDetails) async {
    try {
      String date = DateFormat("dd-MMM-yyyy/hh:mm:aa").
      format(DateTime.fromMillisecondsSinceEpoch(DateTime
          .now()
          .millisecondsSinceEpoch));

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString(
          'id', patientDetails.countryCode + patientDetails.phone);
      await preferences.setString('pass', patientDetails.password);
      final String id = patientDetails.countryCode +
          patientDetails.phone.trim();

      if (patientDetails.takenTeleService) {
        await FirebaseFirestore.instance.collection('Doctors').doc(id).set({
          'id': id,
          'name': patientDetails.fullName,
          'phone': patientDetails.phone,
          'password': patientDetails.password,
          'email': patientDetails.email,
          'country': patientDetails.country,
          'state': patientDetails.state,
          'city': patientDetails.city,
          'joinDate': date,
          'gender': patientDetails.gender,
          'currency': patientDetails.currency,
          'imageUrl': patientDetails.imageUrl,
          'bloodGroup': patientDetails.bloodGroup,
          'address': patientDetails.address,
          'countryCode': patientDetails.countryCode,
        });
        return true;
      } else {
        await FirebaseFirestore.instance.collection('Doctors').doc(id).set({
          'id': id,
          'name': patientDetails.fullName,
          'phone': patientDetails.phone,
          'password': patientDetails.password,
          'email': patientDetails.email,
          'country': patientDetails.country,
          'state': patientDetails.state,
          'city': patientDetails.city,
          'joinDate': date,
          'gender': patientDetails.gender,
          'currency': patientDetails.currency,
          'imageUrl': patientDetails.imageUrl,
          'bloodGroup': patientDetails.bloodGroup,
          'address': patientDetails.address,
          'countryCode': patientDetails.countryCode,
        });
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}