import 'package:flutter/material.dart';
import 'package:users_panel/shared/widget.dart';
class DoctorAvailability extends StatefulWidget {
  @override
  _DoctorAvailabilityState createState() => _DoctorAvailabilityState();
}

class _DoctorAvailabilityState extends State<DoctorAvailability> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height*.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height*.01,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                width: size.width*.98,
                child: Text("Availability Timing",style: colonTextStyle(),textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                  color: Color(0xffF4F7F5),
                ),
              ),
              SizedBox(height: size.height*.01,),
              Container(
                height: size.height*.62,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      child: Text("Commercial Zone",style: boldTextStyle(),),
                      decoration: BoxDecoration(
                        color: Color(0xffF4F7F5),
                      ),
                    ),
                    ListTile(
                      title: Text("Saturday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                    ListTile(
                      title: Text("Sunday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                    ListTile(
                      title: Text("Monday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                    ListTile(
                      title: Text("Tuesday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                    ListTile(
                      title: Text("Wednesday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                    ListTile(
                      title: Text("Thursday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                    ListTile(
                      title: Text("Friday"),
                      subtitle: Text("7:00 PM - 9:00PM"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
