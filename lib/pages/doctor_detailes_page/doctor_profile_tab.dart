import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_panel/pages/doctor_detailes_page/doctor_availability.dart';
import 'package:users_panel/pages/doctor_detailes_page/doctor_feedback.dart';
import 'package:users_panel/pages/doctor_detailes_page/doctor_profile.dart';
import 'package:users_panel/pages/doctor_detailes_page/faq_page.dart';
import 'package:users_panel/pages/subpage/appointment.dart';

class DoctorOwnDetails extends StatefulWidget {
  String doctorImage;
  String doctorName;
  String doctorDegree;
  String bmdcNumber;
  String doctorPropession;
  String doctorWorkPlace;
  String telFee;
  String applFee;
  String experienced;
  DoctorOwnDetails(
      {this.doctorImage,
        this.doctorName,
        this.doctorDegree,
        this.bmdcNumber,
        this.doctorPropession,
        this.doctorWorkPlace,
        this.telFee,
        this.applFee,
        this.experienced
      }
      );
  @override
  _DoctorOwnDetailsState createState() => _DoctorOwnDetailsState();
}

class _DoctorOwnDetailsState extends State<DoctorOwnDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Doctor Profile"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 12,
              ),
              tabs: [
                Tab(
                  icon: Icon(Icons.account_box,),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(Icons.alarm,),
                  text: 'Availability',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Feedback',
                ),
                Tab(
                  icon: Icon(Icons.announcement_outlined),
                  text: 'FAQs',
                ),

              ]),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(

              children: [
                DoctorProfile(
                  doctorImage:widget.doctorImage,
                  doctorName:widget.doctorName,
                  doctorDegree:widget.doctorDegree,
                  bmdcNumber:widget.bmdcNumber,
                  doctorPropession:widget.doctorPropession,
                  doctorWorkPlace:widget.doctorWorkPlace,
                  telFee:widget.telFee,
                  applFee:widget.applFee,
                  experienced:widget.experienced,

                ),
                DoctorAvailability(),
                DoctorFeedback(),
                FAQPage()
              ]
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Container(

              width: MediaQuery.of(context).size.width*0.95,
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Text("Book Your Appointment",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff00C5A4),
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Appointment()));
            },
          ),
        ),
      ),
    );
  }
}
