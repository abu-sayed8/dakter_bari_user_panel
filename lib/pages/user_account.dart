import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_panel/pages/login_page.dart';
import 'package:users_panel/pages/subpage/update_user_profile_page.dart';
import 'package:users_panel/providers/firebase_operation_provider.dart';
import 'package:users_panel/providers/reg_auth_provider.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/widgets/notification_widget.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //final FirebaseOperation operation = Provider.of<FirebaseOperation>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xffAAF1E8),
      appBar: customAppBarDesign(context, "My Account"),
      body: _bodyUI(),
    );
  }
  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Consumer<FirebaseOperation>(
      builder: (context, operation, child){
        return ListView(
          children: [
            ///Account Section...
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              height: size.height * .25,
              width: size.width,
              child: Row(
                children: [
                  Container(
                    width: size.width * .46,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffAAF1E8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    // child: operation.patientList[0].imageUrl==null?
                    // Image.asset("assets/male.png", width: 150):ClipRRect(
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //   child: CachedNetworkImage(
                    //     imageUrl: operation.patientList[0].imageUrl,
                    //     placeholder: (context, url) => Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: CircularProgressIndicator(),
                    //     ),
                    //     errorWidget: (context, url, error) => Icon(Icons.error),
                    //     width: size.width * .46,
                    //     height: size.height * .25,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                  Container(
                    width: size.width * .42,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("sayed",
                          //operation.patientList[0].fullName ?? 'Your name',
                          maxLines: 3,
                          style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.width / 15),
                        Text(
                          "01938327326",
                          //operation.patientList[0].id ?? 'Your phone number',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            ///Account Options Section...
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Color(0xffF4F7F5),
              height: size.height * .59,
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size.width / 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.7),
                children: [
                  FunctionBuilder(
                    title: "My Profile",
                    subtitle: "Set up profile",
                    iconData: Icons.account_box_outlined,
                  ),

                  FunctionBuilder(
                    title: "Logout",
                    subtitle: "See you soon",
                    iconData: Icons.logout,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
class FunctionBuilder extends StatelessWidget {
  String title, subtitle;
  IconData iconData;

  FunctionBuilder({this.title, this.subtitle, this.iconData});

  @override
  Widget build(BuildContext context) {
    final RegAuth regAuth=Provider.of<RegAuth>(context);
    return Consumer<FirebaseOperation>(
      builder: (context, operation, child){
        return InkWell(
          onTap: ()async {
            if (title == "My Profile") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateUserProfile()));
            }

            if (title == "Logout") {
              operation.loadingMgs = 'Logging out...';
              showLoadingDialog(context, operation);

              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear().then((value){

                regAuth.patientDetails=null;
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                        (route) => false);
                //await FirebaseAuth.instance.signOut().then((value) {});
              });

            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(.2, .5), blurRadius: 2)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: Color(0xff00D5BA),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800]),
                ),
                SizedBox(height: 10),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}