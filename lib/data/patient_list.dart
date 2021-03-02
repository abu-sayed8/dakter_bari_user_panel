import 'package:users_panel/model/patient_model.dart';

List<PatientDetailsModel> getPatientInfo(){
  List<PatientDetailsModel> list = List<PatientDetailsModel>();
  PatientDetailsModel appointmentList = new PatientDetailsModel();

  appointmentList.fullName = "Ismail Hossain";
  appointmentList.problem = "Heart problem";
  appointmentList.joinDate = "24 Dec, 2020 | 12:04 pm";
  appointmentList.imageUrl = "assets/male.png";
  appointmentList.age = "23";
  appointmentList.gender = "Male";
  appointmentList.address = "Uttara, Dhaka, Bangladesh";
  list.add(appointmentList);

  appointmentList = new PatientDetailsModel();
  appointmentList.fullName = "Somon Islam";
  appointmentList.problem = "Mental problem";
  appointmentList.joinDate = "24 Dec, 2020 | 08:04 am";
  appointmentList.imageUrl = "assets/male.png";
  appointmentList.age = "32";
  appointmentList.gender = "Male";
  appointmentList.address = "Khilkhet, Dhaka, Bangladesh";
  list.add(appointmentList);

  appointmentList = new PatientDetailsModel();
  appointmentList.fullName = "Jesicca Jessy";
  appointmentList.problem = "Breath problem";
  appointmentList.joinDate = "23 Dec, 2020 | 01:34 pm";
  appointmentList.imageUrl = "assets/female.png";
  appointmentList.age = "22";
  appointmentList.gender = "Female";
  appointmentList.address = "Gazipur, Dhaka, Bangladesh";
  list.add(appointmentList);

  appointmentList = new PatientDetailsModel();
  appointmentList.fullName = "Jony Sing";
  appointmentList.problem = "Blood problem";
  appointmentList.joinDate = "23 Dec, 2020 | 02:34 pm";
  appointmentList.imageUrl = "assets/male.png";
  appointmentList.age = "22";
  appointmentList.gender = "Male";
  appointmentList.address = "Gazipur, Dhaka, Bangladesh";
  list.add(appointmentList);

  appointmentList.fullName = "Jaquline Farnandez";
  appointmentList.problem = "Heart problem";
  appointmentList.joinDate = "24 Dec, 2020 | 12:04 pm";
  appointmentList.imageUrl = "assets/female.png";
  appointmentList.age = "22";
  appointmentList.gender = "Female";
  appointmentList.address = "Gazipur, Dhaka, Bangladesh";
  list.add(appointmentList);

  appointmentList = new PatientDetailsModel();
  appointmentList.fullName = "Angelina Jolly";
  appointmentList.problem = "Mental problem";
  appointmentList.joinDate = "24 Dec, 2020 | 08:04 am";
  appointmentList.imageUrl = "assets/female.png";
  appointmentList.age = "22";
  appointmentList.gender = "Female";
  appointmentList.address = "Gazipur, Dhaka, Bangladesh";
  list.add(appointmentList);

  appointmentList = new PatientDetailsModel();
  appointmentList.fullName = "Sujon Islam";
  appointmentList.problem = "Breath problem";
  appointmentList.joinDate = "23 Dec, 2020 | 01:34 pm";
  appointmentList.imageUrl = "assets/male.png";
  appointmentList.age = "22";
  appointmentList.gender = "Male";
  appointmentList.address = "Gazipur, Dhaka, Bangladesh";
  list.add(appointmentList);

  return list;
}