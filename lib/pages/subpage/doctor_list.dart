import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:users_panel/data/doctor_list_data.dart';
import 'package:users_panel/model/doctors_model.dart';
import 'package:users_panel/pages/doctor_detailes_page/doctor_profile_tab.dart';
import 'package:users_panel/shared/widget.dart';
import 'package:users_panel/utils/custom_clipper.dart';
class Doctor extends StatefulWidget {
  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  List<Doctors> doctor=List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctor = getDoctorsListsDetails();
  }
  ScrollController _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F7F5),
      appBar: _customAppBar(),
      body: _bodyUI(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
  Widget _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
        title: Text(
          'Doctors',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: MyCustomClipperForAppBar(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Color(0xffBCEDF2),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  tileMode: TileMode.clamp,
                )),
          ),
        ),
        actions: [
          IconButton(
            splashColor: Theme.of(context).primaryColor,
            splashRadius: 20,
            icon: Icon(
              Icons.search_rounded,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffBCEDF2),
      height: size.height,
      width: size.width,
      //padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ListView.builder(
                itemCount: doctor.length,
                itemBuilder: (context, index) {
                  return DoctorBuildersTile(
                    doctorImage: doctor[index].doctorImage,
                    doctorName: doctor[index].doctorName,
                    doctorDegree: doctor[index].doctorDegree,
                    bmdcNumber: doctor[index].bmdcNumber,
                    doctorPropession: doctor[index].doctorPropession,
                    doctorWorkPlace: doctor[index].doctorWorkPlace,
                    telFee: doctor[index].telFee,
                    applFee: doctor[index].applFee,
                    experienced: doctor[index].experienced,
                  );
                }
      ),
    );
  }
}
class DoctorBuildersTile extends StatelessWidget {

  String doctorImage,doctorName,doctorDegree,bmdcNumber,doctorPropession,doctorWorkPlace,telFee,applFee,experienced;
  DoctorBuildersTile({this.doctorImage,this.doctorName,this.doctorDegree,
    this.bmdcNumber,this.doctorPropession,this.doctorWorkPlace,this.telFee,this.applFee,this.experienced});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return InkWell(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorOwnDetails(
        doctorImage:doctorImage,
          doctorName:doctorName,
          doctorDegree:doctorDegree,
          bmdcNumber:bmdcNumber,
          doctorPropession:doctorPropession,
          doctorWorkPlace:doctorWorkPlace,
          telFee:telFee,
          applFee:applFee,
          experienced:experienced,
      ))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: size.width*0.22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(doctorImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                ),
                Container(
                    width: size.width*0.70,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Container(
                                 width:size.width*.37,

                                   child: Text('$doctorName' ,style: boldTextStyle(),textAlign: TextAlign.left)),
                              SizedBox(
                                width: size.width*.05,
                              ),
                              Container(
                                width: size.width*0.25,
                                padding: EdgeInsets.symmetric(horizontal: 3,vertical: 5.0),
                                decoration: BoxDecoration(
                                    color: Color(0xff00C5A4),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text("Appointment",style:TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              )
                            ],),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Row(children: [
                            Container(
                              width: size.width*0.37,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doctorDegree ,style: TextStyle(fontSize: 12)),
                                  Text(doctorPropession ,style: TextStyle(fontSize: 11)),
                                  Text(doctorWorkPlace ,style: TextStyle(fontSize: 11)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width*.05,
                            ),
                            Container(
                              width: size.width*0.25,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Today's Fees: $telFee",style: smallTextStyle(),textAlign: TextAlign.center,),
                                  Text("Most Popular",style: TextStyle(fontSize: 12,color: Color(0xff00C5A4))),
                                ],
                              ),
                            )
                          ],
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}