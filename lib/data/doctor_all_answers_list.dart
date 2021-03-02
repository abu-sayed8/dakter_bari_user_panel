import 'package:users_panel/model/doctor_all_answer_model.dart';

List<DoctorAllAnswers> getDoctorAllAnswers(){
  List<DoctorAllAnswers> list = List();

  DoctorAllAnswers patients = DoctorAllAnswers();
  patients.doctorImage ="assets/doctor.jpg";
  patients.doctorName = 'Md abu abdullah sani';
  patients.dateOfTime = "December 01,2020";
  patients.institutionName='Bangladesh Medical College';
  list.add(patients);

  patients = DoctorAllAnswers();
  patients.doctorImage ="assets/doctor.jpg";
  patients.doctorName = 'Md abu abdullah sani';
  patients.dateOfTime = "December 01,2020";
  patients.institutionName='Law · Partner at litigation boutique, ';
  list.add(patients);

  patients = DoctorAllAnswers();
  patients.doctorImage ="assets/doctor.jpg";
  patients.doctorName = 'Md abu abdullah sani';
  patients.dateOfTime = "December 01,2020";
  patients.institutionName='Bangobondhu shekh Mujib Medical University';
  list.add(patients);

  patients = DoctorAllAnswers();
  patients.doctorImage ="assets/doctor.jpg";
  patients.doctorName = 'Md abu abdullah sani';
  patients.dateOfTime = "December 01,2020";
  patients.institutionName='Bangladesh Medical College';
  list.add(patients);

  return list;
}