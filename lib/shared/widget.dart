import 'package:flutter/material.dart';

simpleTextStyle(){
  return TextStyle(
      color: Colors.black,
      fontSize: 16,
  );
}
colonTextStyle(){
  return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color(0xff00C5A4),
  );
}
boldTextStyle(){
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
}
smallTextStyle(){
  return TextStyle(
      fontSize: 14,
  );
}
doctorListTextStyle(){
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

formInputTextField(String textFieldHintText){
  return  TextField(
    decoration: InputDecoration(
      hintText: textFieldHintText,

      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          ),

    ),
  );
}
doctorAppointment(appointment,appointmentDetails){
  return Column(
    children: [

      Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(appointment),
      ),
      Text(appointmentDetails,textAlign: TextAlign.center),
    ],
  );
}

//Shopping Heading Decoration
headingDecoration(context,headingText){
  Size size=MediaQuery.of(context).size;
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
  width: size.width*.98,
  child: Text(headingText,style: colonTextStyle(),textAlign: TextAlign.center,),
  decoration: BoxDecoration(
  color: Color(0xffF4F7F5),
  )
  );
}

InputDecoration shoppingFormInputDecoration(String hintText){
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      fillColor: Colors.white,
      filled: true,
      hintText:hintText
  );
}

