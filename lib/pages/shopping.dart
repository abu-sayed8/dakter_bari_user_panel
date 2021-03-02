import 'package:flutter/material.dart';
import 'package:users_panel/data/doctor_all_answers_list.dart';
import 'package:users_panel/model/doctor_all_answer_model.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<DoctorAllAnswers> patient = List();

  @override
  void initState() {
    super.initState();
    patient = getDoctorAllAnswers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xffF4F7F5),
      appBar: customAppBarDesign(context, 'Happy Shopping'),
      body: _bodyUI(),
    );
  }

}
Widget _bodyUI() {
  return Center(
    child: Text("Shopping feature is coming soon !" ),
  );
}


