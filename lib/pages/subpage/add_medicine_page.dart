import 'package:flutter/material.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/form_decoration.dart';
import 'package:users_panel/shared/static_variable_page.dart';

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {

  int interactionLine = 1;
  int dosageLine = 1;
  int sideEffectLine = 1;
  int warningLine = 1;
  int overdoseLine = 1;
  int storageLine = 1;
  String selectedDosage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, "Add New Medicine"),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [

            ///Medicine Form...
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  ///Name...
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        hintText: "Medicine Name",
                        fillColor: Color(0xffF4F7F5)),
                  ),
                  SizedBox(height: 20),
                  ///Generic Name...
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        hintText: "Generic Name",
                        fillColor: Color(0xffF4F7F5)),
                  ),
                  SizedBox(height: 20),
                  ///Strength...
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        hintText: "Strength in mg (e.g 250mg/5ml)",
                        fillColor: Color(0xffF4F7F5)),
                  ),
                  SizedBox(height: 20),
                  ///Menufecturar...
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        hintText: "Menufecturar",
                        fillColor: Color(0xffF4F7F5)),
                  ),
                  SizedBox(height: 20),
                  ///Pack Size...
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        hintText: "Pack Size",
                        fillColor: Color(0xffF4F7F5)),
                  ),
                  SizedBox(height: 20),

                  ///Dosage From...
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                        color: Color(0xffF4F7F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    width: size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedDosage,
                        hint: Text("Select Dosage",style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16)),
                        items: StaticVariables.dosageList.map((category){
                          return DropdownMenuItem(
                            child: Text(category,style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,)),
                            value: category,
                          );
                        }).toList(),
                        onChanged: (newValue)=> setState(() => selectedDosage = newValue),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ///Interaction...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: interactionLine,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Interaction"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => interactionLine = 2);
                      if (val.length >= 80) setState(() => interactionLine = 4);
                      if (val.length >= 160) setState(() => interactionLine = 7);
                      if (val.length >= 300) setState(() => interactionLine = 11);
                      if (val.length >= 500) setState(() => interactionLine = 18);
                    },
                  ),
                  SizedBox(height: 20),

                  ///Dosage & Administration...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: dosageLine,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Dosage & Administration"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => dosageLine = 2);
                      if (val.length >= 80) setState(() => dosageLine = 4);
                      if (val.length >= 160) setState(() => dosageLine = 7);
                      if (val.length >= 300) setState(() => dosageLine = 11);
                      if (val.length >= 500) setState(() => dosageLine = 18);
                    },
                  ),
                  SizedBox(height: 20),

                  ///Side effect...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: sideEffectLine,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Side Effect"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => sideEffectLine = 2);
                      if (val.length >= 80) setState(() => sideEffectLine = 4);
                      if (val.length >= 160) setState(() => sideEffectLine = 7);
                      if (val.length >= 300) setState(() => sideEffectLine = 11);
                      if (val.length >= 500) setState(() => sideEffectLine = 18);
                    },
                  ),
                  SizedBox(height: 20),

                  ///Precautions & Warnings...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: warningLine,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Precautions & Warnings"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => warningLine = 2);
                      if (val.length >= 80) setState(() => warningLine = 4);
                      if (val.length >= 160) setState(() => warningLine = 7);
                      if (val.length >= 300) setState(() => warningLine = 11);
                      if (val.length >= 500) setState(() => warningLine = 18);
                    },
                  ),
                  SizedBox(height: 20),

                  ///Overdose effects...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: overdoseLine,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Overdose Effects"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => overdoseLine = 2);
                      if (val.length >= 80) setState(() => overdoseLine = 4);
                      if (val.length >= 160) setState(() => overdoseLine = 7);
                      if (val.length >= 300) setState(() => overdoseLine = 11);
                      if (val.length >= 500) setState(() => overdoseLine = 18);
                    },
                  ),
                  SizedBox(height: 20),

                  ///Storage Conditions...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: storageLine,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Storage Conditions"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => storageLine = 2);
                      if (val.length >= 80) setState(() => storageLine = 4);
                      if (val.length >= 160) setState(() => storageLine = 7);
                      if (val.length >= 300) setState(() => storageLine = 11);
                      if (val.length >= 500) setState(() => storageLine = 18);
                    },
                  ),
                  SizedBox(height: 20),

                  ///Submit Button...
                  GestureDetector(
                    onTap: (){},
                    child: Button(context, "Submit  Medicine"),
                  ),
                  SizedBox(height: 20),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
