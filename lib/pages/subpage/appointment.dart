import 'package:flutter/material.dart';
import 'package:users_panel/pages/subpage/add_family_member.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/widget.dart';
class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String chamberCategory=null,
      selectPatientCategory=null;
  List _selectChamber = [
    'Online Video Consultation Chamber',
    'Offline Video Consultation Chamber',
  ];
  List _patientType = [
    'New',
    'Old',
    'Report',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:customAppBarDesign(context, "Appointment"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  color: Color(0xffF4F7F5),
                ),
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.60,
                        child: Text("Patient Name: Abu Sayed",style: colonTextStyle(),)
                    ),
                    SizedBox(width: 5.0,),
                    GestureDetector(
                      child: Container(
                          width: MediaQuery.of(context).size.width*0.30,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 16.0),
                          decoration: BoxDecoration(
                            color: Color(0xff00C5A4),
                          ),
                          child: Text("Other Patient",style:doctorListTextStyle(),)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFamilyMember()));
                      },
                    ),

                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Color(0xffF4F7F5),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: chamberCategory,
                    hint: Text("Select an option",
                        style:
                        TextStyle(color: Colors.grey[700], fontSize: 16)),
                    items: _selectChamber.map((category) {
                      return DropdownMenuItem(
                        child: Text(category,
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,
                            )),
                        value: category,
                      );
                    }).toList(),
                    onChanged: (newValue) =>
                        setState(() => chamberCategory = newValue),
                    dropdownColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Color(0xffF4F7F5),
                    borderRadius: BorderRadius.circular(10.0)
                ),

                width: MediaQuery.of(context).size.width * 0.95,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectPatientCategory,
                    hint: Text("Please Select Patient Category",
                        style:
                        TextStyle(color: Colors.grey[700], fontSize: 16)),
                    items: _patientType.map((category) {
                      return DropdownMenuItem(
                        child: Text(category,
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,
                            )),
                        value: category,
                      );
                    }).toList(),
                    onChanged: (newValue) =>
                        setState((){
                          if(selectPatientCategory=="Online Video Consultation Chamber"){
                            Container(
                              child: Text("data"),
                            );
                          }
                          else{
                            selectPatientCategory = newValue;
                          }
                        }),
                    dropdownColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              chamberCategory!=null? Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    alignment: Alignment.centerLeft,
                    child: Text("Available Date",style: simpleTextStyle(),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child:  AppointDate(),
                  ),
                  SizedBox(height: 10.0),
                  Container(

                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    alignment: Alignment.centerLeft,
                    child: Text("Available Time",style: simpleTextStyle(),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: AppointTime(),
                  ),
                ],
              ):Container(),


              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Text("Problems",style: simpleTextStyle(),),
              ),
              SizedBox(height: 4.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child:TextFormField(
                  decoration: InputDecoration(
                    hintText: "Problems",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),

                    fillColor: Color(0xffF4F7F5),
                    filled: true,

                  ),
                  maxLines: 4,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.95,
                alignment: Alignment.center,
                child: Text("Get Appointment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                decoration: BoxDecoration(
                    color: Color(0xff00C5A4),
                    borderRadius: BorderRadius.circular(10.0)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class AppointDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appointmentDateContainerDecoration(String dateAndWeek){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF4F7F5),
        ),
        child: Text( dateAndWeek,style: simpleTextStyle(),textAlign: TextAlign.center,),
      );
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        appointmentDateContainerDecoration("Saturday 2021-01-31"),
        SizedBox(
          width: 10,
        ),
        appointmentDateContainerDecoration("Saturday 2021-01-31"),
        SizedBox(
          width: 10,
        ),
        appointmentDateContainerDecoration("Saturday 2021-01-31"),
        SizedBox(
          width: 10,
        ),
        appointmentDateContainerDecoration("Saturday 2021-01-31"),
        SizedBox(
          width: 10,
        ),
        appointmentDateContainerDecoration("Saturday 2021-01-31"),
        SizedBox(
          width: 10,
        ),
        appointmentDateContainerDecoration("Saturday 2021-01-31"),
        SizedBox(
          width: 10,
        ),

      ],
    );
  }
}

class AppointTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appointmentTimeContainerDecoration(String dateAndWeek){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF4F7F5),
        ),
        child: Text( dateAndWeek,style: simpleTextStyle(),textAlign: TextAlign.center,),
      );
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        appointmentTimeContainerDecoration("08 : 00 AM"),
        SizedBox(
          width: 10,
        ),
        appointmentTimeContainerDecoration("08 : 00 AM"),
        SizedBox(
          width: 10,
        ),
        appointmentTimeContainerDecoration("08 : 00 AM"),
        SizedBox(
          width: 10,
        ),
        appointmentTimeContainerDecoration("08 : 00 AM"),
        SizedBox(
          width: 10,
        ),
        appointmentTimeContainerDecoration("08 : 00 AM"),
        SizedBox(
          width: 10,
        ),


      ],
    );
  }
}
