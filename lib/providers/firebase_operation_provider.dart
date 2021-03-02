import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:users_panel/model/patient_model.dart';
import 'package:users_panel/providers/reg_auth_provider.dart';
import 'package:users_panel/widgets/notification_widget.dart';



class FirebaseOperation extends RegAuth {
  // RegAuth regAuth = RegAuth();
   List<PatientDetailsModel> _patientList = List<PatientDetailsModel>();

   //List<PatientDetailsModel> get patientList => List.from(_patientList);

   get patientList=> _patientList;

   Future<void> clearPatientList() async {
      _patientList.clear();
      notifyListeners();
   }

   Future<void> getPatient(String id) async {
      try {
         await FirebaseFirestore.instance.collection('Patients').where('id', isEqualTo: id).get().then((snapShot) {
            //_patientList.clear();
            snapShot.docChanges.forEach((element) {
               PatientDetailsModel patients = PatientDetailsModel(
                  id: element.doc['id'],
                  fullName: element.doc['name'],
                  phone: element.doc['phone'],
                  password: element.doc['password'],
                  email: element.doc['email'],
                  country: element.doc['country'],
                  state: element.doc['state'],
                  city: element.doc['city'],
                  joinDate: element.doc['joinDate'],
                  gender: element.doc['gender'],
                  currency: element.doc['currency'],
                  imageUrl: element.doc['imageUrl'],
                  bloodGroup: element.doc['bloodGroup'],
                  address: element.doc['address'],
                  countryCode: element.doc['countryCode'],
                  takenTeleService: element.doc['takenTeleService'],
               );
               print(_patientList[0].fullName);
               _patientList.add(patients);
            });
         });
         notifyListeners();
         //isLoading = false;
         loadingMgs = '';
      } catch (error) {
         //isLoading = false;
         loadingMgs = '';
      }
   }

   Future<void> updatPatientProfilePhoto(GlobalKey<ScaffoldState> scaffoldKey,
       BuildContext context, var operation, File imageFile) async {
      final id = await getPreferenceData();
      firebase_storage.Reference storageReference =
      firebase_storage.FirebaseStorage.instance.ref()
          .child('Patients Photo')
          .child(id);

      firebase_storage.UploadTask storageUploadTask = storageReference.putFile(
          imageFile);

      firebase_storage.TaskSnapshot taskSnapshot;
      storageUploadTask.then((value) {
         taskSnapshot = value;
         taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl) {
            final imageUrl = newImageDownloadUrl;
            FirebaseFirestore.instance.collection('Patients').doc(id).update({
               'imageUrl': imageUrl,
            }).then((value) async {
               await operation.getDoctor(id);
               Navigator.pop(context);
               showSnackBar(scaffoldKey, 'Profile photo updated');
            });
         }, onError: (error) {
            Navigator.pop(context);
            showSnackBar(scaffoldKey, error.toString());
         });
      }, onError: (error) {
         Navigator.pop(context);
         showSnackBar(scaffoldKey, error.toString());
      });
   }

   Future<void> updatePatientInformation(FirebaseOperation operation,
       GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) async {
      await FirebaseFirestore.instance.collection('Patients').doc(
          operation.patientList[0].id).update({
         'name': operation.patientDetails.fullName.isEmpty ? operation
             .patientList[0].fullName : operation.patientDetails.fullName,
         'email': operation.patientDetails.email.isEmpty ? operation
             .patientList[0].email : operation.patientDetails.email,
         'country': operation.patientDetails.country.isEmpty ? operation
             .patientList[0].country : operation.patientDetails.country,
         'state': operation.patientDetails.state.isEmpty ? operation
             .patientList[0].state : operation.patientDetails.state,
         'city': operation.patientDetails.city.isEmpty ? operation
             .patientList[0].city : operation.patientDetails.city,
      }).then((value) async {
         await operation.getPatient(operation.patientList[0].id).then((value) {
            Navigator.pop(context);
            showSnackBar(scaffoldKey, 'Updated successful');
         }, onError: (error) {
            Navigator.pop(context);
            showSnackBar(scaffoldKey, error.toString());
         });
      }, onError: (error) {
         Navigator.pop(context);
         showSnackBar(scaffoldKey, error.toString());
      });
   }

}