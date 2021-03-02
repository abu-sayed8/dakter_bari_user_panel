import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:users_panel/data/doctor_all_answers_list.dart';
import 'package:users_panel/model/doctor_all_answer_model.dart';
import 'package:users_panel/utils/custom_clipper.dart';
class DoctorAnswers extends StatefulWidget {
  String questions,ansNum;
  DoctorAnswers({this.questions, this.ansNum});
  @override
  _DoctorAnswersState createState() => _DoctorAnswersState();
}

class _DoctorAnswersState extends State<DoctorAnswers> {
  List<DoctorAllAnswers> doctorsAnswers = List();

  @override
  void initState() {
    super.initState();
    doctorsAnswers = getDoctorAllAnswers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      backgroundColor: Color(0xffF4F7F5),
      appBar: _customAppBar(),
      body: _bodyUI(),
      );
  }
  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      //padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 5.0),
              height: size.height*.15,
              color: Colors.white,
              child: Text(widget.questions,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              ),
            ),
            Container(
              height: size.height*.67,
              child: ListView.builder(
                  itemCount: doctorsAnswers.length,
                  itemBuilder: (context, index) {
                    return PatientQuestionTile(
                      doctorImage: doctorsAnswers[index].doctorImage,
                      doctorName: doctorsAnswers[index].doctorName,
                      dateOfTime: doctorsAnswers[index].dateOfTime,
                      institutionName:doctorsAnswers[index].institutionName,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
        title: Text(
          'Doctor Answers',
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
}

// ignore: must_be_immutable
class PatientQuestionTile extends StatelessWidget {
  String doctorImage,doctorName, dateOfTime,institutionName;
  bool _isAns=false;
  PatientQuestionTile({this.doctorImage, this.doctorName,this.dateOfTime,this.institutionName});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 10, left: 2, right: 2),
        padding: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300], offset: Offset(1, 1), blurRadius: 2)
            ]),
        child: ListTile(
           onTap: (){},
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(

                backgroundImage: AssetImage(doctorImage),
                radius: 25,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      maxLines: 1,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.grey[900]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                       Text(
                        dateOfTime,
                        maxLines: 1,
                        style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                      ),

                    Text(
                      institutionName,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3,
              ),
              Text(
                'Answer : ',
                maxLines: 1,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
              Text("Yes. And she was dead 24 hours later."
                  "I was caring for an elderly woman who had taken a few spills at her assisted"
                  "living home that resulted in a fracture. She came to us for rehabilitation"
                  "with the plan of being discharged back to assisted living. Her"
                  "stay was only expected to be 3–4 weeks. She was very hard of hearing but one"
                  "of the sweetest ladies I ever had the pleasure of caring for. Her family was equally as kind.")
            ],
          ),
        ));
  }
}


