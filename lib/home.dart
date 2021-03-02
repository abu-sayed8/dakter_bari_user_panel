import 'package:flutter/material.dart';
import 'package:users_panel/pages/blog_page.dart';
import 'package:users_panel/pages/book_appointment.dart';
import 'package:users_panel/pages/credit_assesments.dart';
import 'package:users_panel/pages/discount_shop_category.dart';
import 'package:users_panel/pages/forum_page.dart';
import 'package:users_panel/pages/helth_insurance.dart';
import 'package:users_panel/pages/join_rider.dart';
import 'package:users_panel/pages/medical_category.dart';
import 'package:users_panel/pages/shopping.dart';
import 'package:users_panel/pages/subpage/prescription_page.dart';
import 'package:users_panel/pages/support_center_page.dart';
import 'package:users_panel/pages/user_account.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color(0xffF4F7F5),
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Dakterbari | ডাক্তারবাড়ি'),
      body: _bodyUI(size),
    );
  }
  Widget _bodyUI(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height * .25,
            decoration: BoxDecoration(
                color: Color(0xffF4F7F5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Image.asset('assets/logo.png')
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * .50,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  //childAspectRatio: .95
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GridBuilderTile(size, index);
                }),
          ),
        ],
      ),
    );
  }
}
class GridBuilderTile extends StatelessWidget {
  int index;
  Size size;

  GridBuilderTile(this.size, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => index == 1
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserAccount()))
          : index == 2
          ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => MedicalDepartment()))
          : index == 3
          ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => BookAppointment()))
          : index == 4
          ? Navigator.push(context,
          MaterialPageRoute(builder: (context) => PrescriptionPage(
          )))
          : index == 5
          ? Navigator.push(context,
          MaterialPageRoute(builder: (context) => DiscountShop()))
          : index == 6
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Shopping()))
          : index == 7
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ForumPage()))
          : index == 8
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlogPage()))
          : index == 9
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreditAssesment()))
          : index == 10
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HealthInsurance()))
          : index == 11
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JoinRider()))
          :  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SupportCenter())),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        //color: Color(0xffF4F7F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.center, children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F7F5),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: index == 1
                        ? AssetImage(
                        'assets/home_icon/account.png')
                          :index == 2
                          ? AssetImage('assets/home_icon/doctor.png')
                          : index == 3
                          ? AssetImage('assets/home_icon/appointment.png')
                          : index == 4
                          ? AssetImage('assets/home_icon/prescription.png')
                          : index == 5
                          ? AssetImage('assets/home_icon/shop.png')
                          : index == 6
                          ? AssetImage(
                          'assets/home_icon/shopping.png')
                          : index == 7
                          ? AssetImage(
                          'assets/home_icon/forum.png')
                          : index == 8
                          ? AssetImage(
                          'assets/home_icon/blog.png')
                          : index == 9
                          ? AssetImage(
                          'assets/home_icon/credit_assesment.png')
                          : index == 10
                          ? AssetImage(
                          'assets/home_icon/health_insurance.png')
                          : index == 11
                          ? AssetImage(
                          'assets/home_icon/join_riders.png')
                          : AssetImage(
                          'assets/home_icon/support.png'),
                    ),
                  ),
                  height: 40,
                  width: 40,
                ),
              ]),
              SizedBox(height: 5),
              Text(
                   index == 1
                    ? 'My Account'
                    :index == 2
                    ? 'Doctors'
                    : index == 3
                    ? 'Appointment'
                    : index == 4
                    ? 'Prescription'
                    : index == 5
                    ? 'Discount Shop'
                    : index == 6
                    ? 'Shopping'
                    : index == 7
                    ? 'Forum'
                    : index == 8
                    ? 'Blog'
                    : index == 9
                    ? 'Credit Assesments'
                    : index == 10
                    ? 'Health Insurance'
                    : index == 11
                    ? 'Join Rider'
                    : 'Support Center',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, //Color(0xff00C5A4),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
