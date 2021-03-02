import 'package:flutter/material.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/form_decoration.dart';
import 'package:users_panel/shared/static_variable_page.dart';

class CreateArticle extends StatefulWidget {
  @override
  _CreateArticleState createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  int titleLine = 1;
  int absLine = 1;
  int introLine = 1;
  int methodLine = 1;
  int resultLine = 1;
  int conclusionLine = 1;
  int ackLine = 1;
  int refLine = 1;

  String title;
  String abstract;
  String introduction;
  String methods;
  String result;
  String conclusion;
  String ack;
  String ref;

  String selectedCategory;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, "Write Article"),
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
            ///Article Image...
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 250,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Icon(Icons.add_photo_alternate,
                          size: 230, color: Color(0xffBCEDF2)),
                      Text(
                        "Select an image for this article",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  )),
            ),

            ///Article Form...
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ///Title...
                    _textFormBuilder('Title'),
                    SizedBox(height: 20),

                    ///Category Dropdown...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffF4F7F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      width: size.width,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedCategory,
                          hint: Text("Select Article Category",style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16)),
                          items: StaticVariables.articleCategoryItems.map((category){
                            return DropdownMenuItem(
                              child: Text(category,style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16,)),
                              value: category,
                            );
                          }).toList(),
                          onChanged: (newValue)=> setState(() => selectedCategory = newValue),
                          dropdownColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    ///Abstract...
                    _textFormBuilder('Abstract'),
                    SizedBox(height: 20),

                    ///Introduction...
                    _textFormBuilder('Introduction'),
                    SizedBox(height: 20),

                    ///Methods...
                    _textFormBuilder('Methods'),
                    SizedBox(height: 20),

                    ///Results/Findings...
                    _textFormBuilder('Results'),
                    SizedBox(height: 20),

                    ///Conclusion...
                    _textFormBuilder('Conclusion'),
                    SizedBox(height: 20),

                    ///Acknowledgements...
                    _textFormBuilder('Acknowledgements'),
                    SizedBox(height: 20),

                    ///References/Work cited...
                    _textFormBuilder('References'),
                    SizedBox(height: 20),

                    ///Submit Button...
                    GestureDetector(
                      onTap: (){
                        if(_formKey.currentState.validate()){

                        }
                      },
                      child: Button(context, "Submit  Article"),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _textFormBuilder(String hint) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: FormDecorationWithoutPrefix.copyWith(
          labelText: hint, fillColor: Color(0xffF4F7F5),
      ),
      validator: (val)=>val.isEmpty? "Enter $hint":null,
      maxLines: hint == 'Title'
          ? titleLine
          : hint == 'Abstract'
          ? absLine
          : hint == 'Introduction'
          ? introLine
          : hint == 'Methods'
          ? methodLine
          : hint == 'Result'
          ? resultLine
          : hint == 'Conclusion'
          ?conclusionLine
          : hint == 'Acknowledgements'
          ?ackLine
          : refLine,

      onChanged: (val) {
        if (hint == 'Title') {
          title = val;
          if (val.length >= 40)
            setState(() => titleLine = 4);
          if (val.length >= 150)
            setState(() => titleLine = 8);
          if (val.length >= 200) setState(() => titleLine = 12);
        } else if (hint == 'Abstract') {
          abstract = val;
          if (val.length >= 40)
            setState(() => absLine = 4);
          if (val.length >= 150)
            setState(() => absLine = 8);
          if (val.length >= 200) setState(() => absLine = 15);
        } else if (hint == 'Introduction') {
          introduction = val;
          if (val.length >= 40)
            setState(() => introLine = 4);
          if (val.length >= 150)
            setState(() => introLine = 8);
          if (val.length >= 200) setState(() => introLine = 15);
        } else if (hint == 'Methods') {
          methods = val;
          if (val.length >= 40)
            setState(() => methodLine = 4);
          if (val.length >= 150)
            setState(() => methodLine = 8);
          if (val.length >= 200) setState(() => methodLine = 15);
        } else if (hint == 'Result') {
          result = val;
          if (val.length >= 40)
            setState(() => resultLine = 4);
          if (val.length >= 150)
            setState(() => resultLine = 8);
          if (val.length >= 200) setState(() => resultLine = 15);
        } else if (hint == 'Conclusion') {
           conclusion= val;
          if (val.length >= 40)
            setState(() => conclusionLine = 4);
          if (val.length >= 150)
            setState(() => conclusionLine = 8);
          if (val.length >= 200) setState(() => conclusionLine = 15);
        }
        else if (hint == 'Acknowledgements') {
          ack = val;
          if (val.length >= 40)
            setState(() => ackLine = 4);
          if (val.length >= 150)
            setState(() => ackLine = 8);
          if (val.length >= 200) setState(() => ackLine = 15);
        }
        else if (hint == 'References') {
          ref = val;
          if (val.length >= 40)
            setState(() => refLine = 4);
          if (val.length >= 150)
            setState(() => refLine = 8);
          if (val.length >= 200) setState(() => refLine = 15);
        }
      },
    );
  }
}
