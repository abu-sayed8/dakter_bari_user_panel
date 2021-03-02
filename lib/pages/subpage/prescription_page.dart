import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/widget.dart';


// ignore: must_be_immutable
class PrescriptionPage extends StatefulWidget {
  // String name, age, address, gender, imageUrl, problem;
  //
  // PrescriptionPage(
  //     {this.name,
  //     this.age,
  //     this.address,
  //     this.gender,
  //     this.imageUrl,
  //     this.problem});

  @override
  _PrescriptionPageState createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xffF4F7F5),
      appBar: customAppBarDesign(context, "Prescribe to Ismail Hossain"),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: ListView(
        children: [
          _topSectionBuilder(size),
          SizedBox(height: 10),
          _patientInformationSection(size),
          SizedBox(height: 20),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headingDecoration(context,"Prescribe Medicine"),
                SizedBox(height: 8),
                Text("A-One-XR",style: simpleTextStyle(),),
                Text("4 mg",style: simpleTextStyle(),),
                Text("Doges : 8",style: simpleTextStyle(),),
                Text("Duration : 15 daye",style: simpleTextStyle(),),
                SizedBox(height: 10),
                headingDecoration(context,"Patient Problems"),
                SizedBox(height: 8),
                Text("Hairt Problem",style: simpleTextStyle(),),
                SizedBox(height: 10),
                headingDecoration(context,"RX."),
                SizedBox(height: 8),
                Text("CBC, X-Rey",style: simpleTextStyle(),),
                SizedBox(height: 10),
                headingDecoration(context,"Advice"),
                SizedBox(height: 8),
                Text("Rest now",style: simpleTextStyle(),textAlign: TextAlign.justify,),
                SizedBox(height: 10),
                headingDecoration(context,"Next Visite"),
                SizedBox(height: 8),
                Text("Between 1 month",style: simpleTextStyle(),),

              ],
            ),
          ),
         SizedBox(height: 20),

          // GestureDetector(
          //   onTap: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     child: Button(context, 'Confirm Prescribe'),
          //   ),
          // ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _topSectionBuilder(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      //color: Color(0xffF4F7F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            child: Image.asset('assets/logo.png', height: 45,),
          ),
          SizedBox(height: size.width / 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage('assets/doctor.jpg')
                  )
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Dr. Joseph Williamson",
                maxLines: 1,
                style: TextStyle(
                    fontSize: size.width / 20,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            "M.B.B.S, M.S (Ortho)",
            maxLines: 2,
            style:
                TextStyle(fontSize: size.width / 32, color: Colors.grey[700]),
          ),
          SizedBox(height: size.width / 40),
          Text(
            "751 Victoria 123 Street, South Statue 204",
            maxLines: 2,
            style:
                TextStyle(fontSize: size.width / 30, color: Colors.grey[700]),
          ),
          Text(
            "Hometown: US 1234",
            maxLines: 1,
            style:
                TextStyle(fontSize: size.width / 30, color: Colors.grey[700]),
          ),
          Text(
            "Phone: +8801830200087",
            maxLines: 1,
            style:
                TextStyle(fontSize: size.width / 30, color: Colors.grey[700]),
          ),
          Text(
            "Email: josefortho@gmail.com",
            maxLines: 1,
            style:
                TextStyle(fontSize: size.width / 30, color: Colors.grey[700]),
          ),
          SizedBox(height: size.width / 40),
          Container(
            height: 2,
            width: size.width,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget _patientInformationSection(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //color: Color(0xffF4F7F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Date & S.No
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * .43,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Date: ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: size.width / 30,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "30/Dec/2020",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: size.width / 32,
                              color: Colors.grey[800]),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[800],
                          width: size.width * .34,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: size.width * .43,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "P.No: ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: size.width / 30,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "20",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: size.width / 32,
                              color: Colors.grey[800]),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[800],
                          width: size.width * .33,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          //Patient Name
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Patient Name: ",
                maxLines: 1,
                style: TextStyle(
                    fontSize: size.width / 30,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ismail Hossain",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: size.width / 32, color: Colors.grey[800]),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[800],
                    width: size.width * .71,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 5),

          //Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Address: ",
                maxLines: 1,
                style: TextStyle(
                    fontSize: size.width / 30,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dhaka",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: size.width / 32, color: Colors.grey[800]),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[800],
                    width: size.width * .79,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 5),

          //Age & Gender
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * .43,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Age: ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: size.width / 30,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "25",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: size.width / 32,
                              color: Colors.grey[800]),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[800],
                          width: size.width * .35,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: size.width * .43,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Gender: ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: size.width / 30,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Male",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: size.width / 32,
                              color: Colors.grey[800]),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[800],
                          width: size.width * .29,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
