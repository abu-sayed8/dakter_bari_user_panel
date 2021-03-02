import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/widget.dart';
class AddFamilyMember extends StatefulWidget {
  @override
  _AddFamilyMemberState createState() => _AddFamilyMemberState();
}

class _AddFamilyMemberState extends State<AddFamilyMember> {
  @override
  Widget build(BuildContext context) {
    accountOwner(String profile,String userName,String mobileNumber){
      return Container(
        padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
        width: MediaQuery.of(context).size.width*0.95,
        decoration: BoxDecoration(
          color: Color(0xffF4F7F5),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.10,
              child: CircleAvatar(
                backgroundImage: AssetImage(profile),

              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width*0.80,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child:Text(userName,style:boldTextStyle(),),

                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child:Text(mobileNumber,style:boldTextStyle())
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Add Family Member'),
      body: Container(
        child: ListView(
          children: [
            accountOwner("images/doctor.jpg", "Md Sujit Sarker", "01862878778"),
            SizedBox(
              height: 20,
            ),
            accountOwner("images/doctor.jpg", "Md Sujit Sarker", "01862878778"),
          ],
        ),
      ),
      bottomNavigationBar: RaisedButton(
        color: Color(0xff00C5A4),
        padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
        child: Text("Add Family Member",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context)=>AlertDialog(
                backgroundColor: Color(0xff00C5A4),
                content:AddPatient(),
              )
          );
        },
      ),
    );
  }
}
class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  int group_value;
  String date="";

  DateTime _currentDate = new DateTime.now();
  Future <Null> _selectDate(BuildContext context) async{
    final DateTime _selDate=await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
    );
    setState(() {
      date=DateFormat("dd/MM/yyyy").format(_selDate);
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    group_value=0;
  }

  @override
  Widget build(BuildContext context) {
    inputTextField(String hintText){
      return TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      );
    }
    return Container(
      height: MediaQuery.of(context).size.height*0.49,
      child: Column(
        children: [
          Text("Add Family Member",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(
            height: 28,
          ),
          Container(
              decoration: BoxDecoration(
                color: Color(0xffF4F7F5),
              ),
              child:inputTextField("Patient Name")
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width:MediaQuery.of(context).size.width*0.95,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F7F5),
                  ),
                  width:MediaQuery.of(context).size.width*0.30,

                  child: inputTextField("Age"),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20),
                    width:MediaQuery.of(context).size.width*0.30,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                    ),
                    child: Text(date),
                  ),
                  onTap: (){
                    _selectDate(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            width:MediaQuery.of(context).size.width*0.95,
            decoration: BoxDecoration(
              color: Color(0xffF4F7F5),
            ),
            child: Row(
              children: [
                Container(
                  width:MediaQuery.of(context).size.width*0.30,

                  child: Row(
                    children: [
                      Radio(value: 0, groupValue: group_value,  onChanged: (value){
                        setState(() {
                          group_value=value;
                        });
                      }),
                      Text("Male")
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width:MediaQuery.of(context).size.width*0.30,
                  child: Row(
                    children: [
                      Radio(value: 1, groupValue: group_value, onChanged: (value){
                        setState(() {
                          group_value=value;
                        });
                      }),
                      Text("Female")
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            child: Container(
              width:MediaQuery.of(context).size.width*0.95,
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Text("Create New Account",textAlign: TextAlign.center,),
            ),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
