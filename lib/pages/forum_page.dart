import 'package:flutter/material.dart';
import 'package:users_panel/data/forum_list.dart';
import 'package:users_panel/model/forum_model.dart';
import 'package:users_panel/pages/subpage/doctor_answers.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  List <ForumData>forumDatas=List();

  @override
  void initState() {
    super.initState();
    forumDatas=getForum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Public Forum'),
      body: _bodyUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context)=>AlertDialog(
                //backgroundColor: Color(0xff00C5A4),
                content:AddQuestions(),
                actions: [
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("Cancel",style: TextStyle(color: Color(0xff00C5A4)),)),

                  FlatButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                      child: Text("Add Question",style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Color(0xff00C5A4),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  )),

                ],
              )
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Add Question',
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }
  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
           Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: size.height * .06,
              width: size.width,
              color: Colors.white,
              child: Row(
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      height: size.height * .04,
                      width: size.height * .04,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 25,
                    ),
                  ]),
                  SizedBox(width: 10),
                  Text(
                    "Question For You",
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  )
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(color: Theme.of(context).primaryColor),
          ),
          Container(
            height: size.height * .72,
            width: size.width,
            child: ListView.builder(
              itemCount: forumDatas.length,
              itemBuilder: (context, index) {
                return QuestionBuilder(
                  questions: forumDatas[index].questions,
                  ansNum: forumDatas[index].ansNum,
                  );
              }
            ),
          ),
        ],
      ),
    );
  }
}
// ignore: must_be_immutable
class QuestionBuilder extends StatelessWidget {
  String questions,ansNum;
      QuestionBuilder({this.questions,this.ansNum});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorAnswers(
          questions:questions,
        ))),
      child: Container(
        // margin: EdgeInsets.only(
        //   bottom: 10,
        // ),
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Title Section...
            Text(
              questions,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900]),
            ),

            //Middle Section..
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      ansNum,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                  ),

                  Text(
                    "Last followed 12h ago",
                    maxLines: 1,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.grey[900],
            ),
          ],
        ),
      ),
    );
  }
}
class AddQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.40,
      child: Column(
        children: [
          Text("Add Your Questions",
            style: TextStyle(color: Color(0xff00C5A4),fontWeight: FontWeight.bold,fontSize: 20),),

          SizedBox(
            height: 18,
          ),
          Container(
              decoration: BoxDecoration(
                //color: Color(0xffF4F7F5),
              ),
              child:TextField(
                decoration: InputDecoration(
                  hintText: 'Start your question',
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide.none,
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide.none,
                  // ),
                ),
                maxLines: 3,
              )
          ),
        ],
      ),
    );
  }
}



// class QuestionBuilder extends StatefulWidget {
//   String questions,ansNum,
//   QuestionBuilder({this.questions,this.ansNum});
//
//   @override
//   _QuestionBuilderState createState() => _QuestionBuilderState();
// }
//
// class _QuestionBuilderState extends State<QuestionBuilder> {
//   bool _isAns = false;
//   int tempIndex;
//   //String patientQuestion;
//  // _QuestionBuilderState(this.patientQuestion)
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorAnswers(
//           questions:questions,
//         )));
//       },
//       child: Container(
//         // margin: EdgeInsets.only(
//         //   bottom: 10,
//         // ),
//         padding: EdgeInsets.only(left: 10, right: 10),
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //Title Section...
//             Text(
//               questions,
//               maxLines: 2,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[900]),
//             ),
//
//             //Middle Section..
//             Container(
//               width: size.width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//
//                   GestureDetector(
//                     child: Text(
//                           "7 Answers · ",
//                           maxLines: 1,
//                           style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey[700]),
//                         ),
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorAnswers()));
//                     },
//                   ),
//
//                   Text(
//                     "Last followed 12h ago",
//                     maxLines: 1,
//                     style: TextStyle(fontSize: 13, color: Colors.grey[700]),
//                   ),
//                 ],
//               ),
//             ),
//
//             Divider(
//               color: Colors.grey[900],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
