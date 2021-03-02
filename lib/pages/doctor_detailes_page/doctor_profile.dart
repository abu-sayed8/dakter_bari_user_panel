import 'package:flutter/material.dart';
import 'package:users_panel/shared/widget.dart';
class DoctorProfile extends StatefulWidget {
  String doctorImage;
  String doctorName;
  String doctorDegree;
  String bmdcNumber;
  String doctorPropession;
  String doctorWorkPlace;
  String telFee;
  String applFee;
  String experienced;
  DoctorProfile(
      {this.doctorImage,
        this.doctorName,
        this.doctorDegree,
        this.bmdcNumber,
        this.doctorPropession,
        this.doctorWorkPlace,
        this.telFee,
        this.applFee,
        this.experienced
      }
      );
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bodyUI(),
    );
  }
  Widget _bodyUI(){
    Size size=MediaQuery.of(context).size;
    return  ListView(
        children: [
          Container(
            height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    //width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.doctorImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                  ),
                        // CircleAvatar(
                        //   backgroundImage: AssetImage(widget.doctorImage),
                        //   radius: 55.0,
                        // ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(widget.doctorName,style: boldTextStyle()),
                  Container(
                    width: size.width*.75,
                    child: Column(
                      children: [
                        Text(widget.doctorDegree,style: simpleTextStyle()),
                        Text(widget.bmdcNumber,style: simpleTextStyle(),),
                        Text(widget.doctorPropession,style: simpleTextStyle(),),
                        Text(widget.doctorWorkPlace,style: simpleTextStyle(),),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 8.0,
                  ),
                ],
              )
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              children: [
                headingDecoration(context,"Experienced & Fee"),
                SizedBox(height: 8.0,),
                _buildExperinceAndFees(context,widget.experienced),
                SizedBox(height: 8.0,),
                _buildExperinceAndFees(context,widget.applFee),
                SizedBox(height: 8.0,),
                _buildExperinceAndFees(context,widget.telFee),
              ],
            ),//child: CategoryContainerUI(),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width*0.95,
            child: Column(
              children: [
                headingDecoration(context,"About Doctor"),
                SizedBox(height: 10,),
                Text("Dr. Md Monjurul Islam is an Associate Professor in the Department "
                    "of Rural Development at Bangabandhu Sheikh Mujibur Rahman Agricultural "
                    "University (BSMRAU), Gazipur, Bangladesh. He has awarded PhD from the"
                    " University of Tsukuba, Tsukuba, Japan in 2018. He obtained B. Sc. Ag. Econ."
                    " (Hons.) With first class in 2004 and in 2007 he secured First Class First"
                    " Position in the MS in Rural Sociology from the Bangladesh Agricultural "
                    "University (BAU), Mymensingh, Bangladesh. He is the first personnel "
                    "who started to lead the Department of Rural Development, BSMRAU, Bangladesh. "
                    "Before joining in the department, he joined as a lecturer in the Department of "
                    "Agricultural and Rural Development, Sylhet Agricultural University, Sylhet,"
                    " Bangladesh in 2008. He was promoted as an Assistant Professor on the same department"
                    " in 2010. He led the Department of Agricultural and Rural Development as Chairman, "
                    "launched undergraduate and MS programs. He also worked as an Assistant Proctor on"
                    " the proctorial body of SAU, Sylhet. He was involved in different social and "
                    "volunteer organizations; Rover Scout, Lecturer and Assistant Professors Society "
                    "(LAPS), Teachers Association, SAU, Sylhet etc. Mr. Islam is a life member of Krishibid"
                    " Institution Bangladesh (KIB), Bangladesh Economics Association (BEA), Bangladesh "
                    "Agricultural Economics Association (BAEA) and the Bangladesh Advancement of Science "
                    "(BAAS), Bangabandhu Agricultural Economist Porishod, Japanese Universities Alumni "
                    "Association in Bangladesh (JUAAB), Australian Agricultural and Resource "
                    "Economics Society (AARES)",style: smallTextStyle(),textAlign: TextAlign.justify),
              ],
            ),
          ),
          ///Services...
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.width / 20),
                Text(
                  "Services",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: size.width / 20),
                _buildServices("Hypertension Treatment"),
                SizedBox(height: size.width / 20),
                _buildServices("COPD Treatment"),
                SizedBox(height: size.width / 20),
                _buildServices("Diabetes Management"),
                SizedBox(height: size.width / 20),
                _buildServices("ECG"),
                SizedBox(height: size.width / 20),
                _buildServices("Obesity Treatment"),
                SizedBox(height: size.width / 20),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "+5 more",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    )),
                SizedBox(
                  height: size.width / 20,
                ),
              ],
            ),
          ),
          ///Specifications...
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width / 20,
                ),
                Text(
                  "Specifications",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.width / 20,
                ),
                _buildServices("General Physician"),
                SizedBox(
                  height: size.width / 20,
                ),
                _buildServices("Family Physician"),
                SizedBox(
                  height: size.width / 20,
                ),
                _buildServices("Cardiologist"),
                SizedBox(
                  height: size.width / 20,
                ),
                _buildServices("Consultant Physician"),
                SizedBox(
                  height: size.width / 20,
                ),
                _buildServices("Diabetologist"),
                SizedBox(
                  height: size.width / 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "+1 more",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    )),
                SizedBox(
                  height: size.width / 20,
                ),
              ],
            ),
          ),
        ],
    );
  }
  Widget _buildServices(String serviceName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          serviceName,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800]),
        ),
        Icon(
          Icons.cancel_presentation,
          color: Colors.red[400],
        )
      ],
    );
  }
  _buildExperinceAndFees(BuildContext context,String buildText){
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
      ),
      child: Text(buildText,style: simpleTextStyle(),),
    );
  }

}
// class CategoryContainerUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     categoryContainer(String titleText){
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//         width: 110,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//         ),
//         child: Text( titleText,style: simpleTextStyle(),textAlign: TextAlign.center,),
//       );
//     }
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: [
//         categoryContainer("Day"),
//         SizedBox(width: 5,),
//         categoryContainer("Week"),
//         SizedBox(width: 5,),
//         categoryContainer("Day"),
//         SizedBox(width: 5,),
//         categoryContainer("Week"),
//         SizedBox(width: 5,),
//         categoryContainer("Day"),
//         SizedBox(width: 5,),
//         categoryContainer("Week"),
//         SizedBox(width: 5,),
//
//       ],
//     );
//   }
// }
