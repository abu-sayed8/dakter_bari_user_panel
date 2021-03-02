import 'package:flutter/material.dart';
import 'package:users_panel/pages/medical_category.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Select Appointment'),
      body: Center(
        child: RaisedButton(
            child: Text("Click here to take an appointment"),
            color:  Color(0xff00C5A4),
            onPressed: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicalDepartment()));
              });
            }),
      ),

    );
  }
}
