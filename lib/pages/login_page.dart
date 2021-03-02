import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_panel/home.dart';
import 'package:users_panel/pages/register_page.dart';
import 'package:users_panel/providers/firebase_operation_provider.dart';
import 'package:users_panel/providers/reg_auth_provider.dart';
import 'package:users_panel/shared/form_decoration.dart';
import 'package:users_panel/widgets/notification_widget.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isConnected = true;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  void _checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.none) {
      setState(() => _isConnected = false);
      showSnackBar(_scaffoldKey,"No internet connection !");
    } else if (result == ConnectivityResult.mobile) {
      setState(() => _isConnected = true);
    } else if (result == ConnectivityResult.wifi) {
      setState(() => _isConnected = true);
    }

  }

  void _initializeDoctorData(RegAuth regAuth) async{
    regAuth.patientDetails.phone='';
    regAuth.patientDetails.password='';
  }
  @override
  Widget build(BuildContext context) {

    final RegAuth regAuth=Provider.of<RegAuth>(context);

    if(regAuth.patientDetails.phone==null) _initializeDoctorData(regAuth);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      //resizeToAvoidBottomInset: false,
      body: _isConnected ?
      _bodyUI(regAuth)
          : _noInternetUI(),
    );
  }

  Widget _bodyUI(RegAuth regAuth) {
    final Size size = MediaQuery.of(context).size;
    final Color colorPrimaryAccent = Color(0xffBCEDF2);
    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Heading Section
            Container(
              height: size.height * .40,
              width: size.width,
              color: colorPrimaryAccent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///Logo Icon...
                  Positioned(
                      top: size.height * .09,
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(
                            "assets/logo.png",
                            height: 50,
                            //width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),

                  ///patient Image...
                  Positioned(
                    bottom: -(size.height * .04),
                    child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: Image.asset(
                          "assets/doctor_patient.png",
                          height: 200,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            //Phone number field
            Container(
              width:size.width*.90,
              child: Material(
                color: Colors.white,
                elevation: 2,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        width:size.width*.35,
                        child: _countryCodePicker(regAuth)
                    ),
                    Container(
                      width:size.width*.54,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (val)=> setState(()=>regAuth.patientDetails.phone = val),
                        decoration:
                        FormDecoration.copyWith(
                          labelText: 'Phone number',
                          prefixIcon: null,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            //password field
            Container(
              width: size.width * .90,
              //height: 50,
              alignment: Alignment.center,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextFormField(
                  obscureText: _obscure,
                  keyboardType: TextInputType.text,
                  onChanged: (val)=>
                      setState(()=>regAuth.patientDetails.password = val),
                  decoration: FormDecoration.copyWith(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.security),
                      suffixIcon: IconButton(
                          icon: _obscure
                              ? Icon(Icons.visibility_off_rounded)
                              : Icon(Icons.remove_red_eye),
                          onPressed: () =>
                              setState(() => _obscure = !_obscure))),
                ),
              ),
            ),
            SizedBox(height: 20),

            //Continue Button...
            Consumer<FirebaseOperation>(
              builder: (context, operation, child){
                return Container(
                  width: size.width * .90,
                  child: GestureDetector(
                    onTap: ()=> _checkValidity(regAuth,operation),
                    child: Button(context, "Continue"),
                  ),
                );
              },
            ),
            SizedBox(height: 40),

            //Register Button
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: size.width / 20),
                ),
                Consumer<RegAuth>(
                  builder: (context, regAuth, child){
                    return GestureDetector(
                      onTap: () {
                        regAuth.patientDetails=null;
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Register()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width / 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _noInternetUI() {
    return Container(
      color: Colors.white70,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            height: 50,
            //width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 40),
          Icon(
            CupertinoIcons.wifi_exclamationmark,
            color: Colors.orange[300],
            size: 150,
          ),
          Text(
            'No Internet Connection !',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          Text(
            'Connect your device with wifi or cellular data',
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),
          SizedBox(height: 20),
          Text(
            "For emergency call 16263",
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () => _checkConnectivity(),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
                width: MediaQuery.of(context).size.width * .25,
                child: miniOutlineIconButton(
                    context, 'Refresh', Icons.refresh, Colors.grey)),
          )
        ],
      ),
    );
  }
  Widget _countryCodePicker(RegAuth regAuth){
    return CountryCodePicker(
      comparator: (a, b) =>
          b.name.compareTo(a.name),
      onChanged: (val) {
        regAuth.patientDetails.countryCode = val.dialCode;
        //print(countryCode);
      },
      onInit: (code) {
        regAuth.patientDetails.countryCode = code.dialCode;
        //print(countryCode);
      },
      favorite: ['+880', 'BD'],
      initialSelection: 'BD',
      showCountryOnly: false,
      showFlag: true,
      showOnlyCountryWhenClosed: false,
      showDropDownButton: true,
      padding: EdgeInsets.only(left: 10),
    );
  }
  void _checkValidity(RegAuth regAuth,FirebaseOperation operation) async{
    if (regAuth.patientDetails.phone.isNotEmpty) {
      if (regAuth.patientDetails.password.isNotEmpty) {
        regAuth.loadingMgs="Logging in. Please wait...";
        showLoadingDialog(context, regAuth);

        //Firebase querySnapshot
        QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Patients')
            .where('phone', isEqualTo: regAuth.patientDetails.phone).get();
        final List<QueryDocumentSnapshot> user = snapshot.docs;
        if(user.isNotEmpty){
          if(user[0].get('password')==regAuth.patientDetails.password){
            //Save data to local
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('id', regAuth.patientDetails.countryCode+regAuth.patientDetails.phone);
            pref.setString('pass', regAuth.patientDetails.password);
            //clear previous patient list
            operation.clearPatientList();
            await operation.getPatient(regAuth.patientDetails.countryCode+regAuth.patientDetails.phone).then((value){
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
            });
          }
          else {
            Navigator.pop(context);
            showSnackBar(_scaffoldKey,"Incorrect password");
          }
        }else{
          Navigator.pop(context);
          showSnackBar(_scaffoldKey,"No patient is registered with this phone");
        }
      }else
        showSnackBar(_scaffoldKey,"Password can't be empty");
    }else
      showSnackBar(_scaffoldKey,"Phone number can't be empty");
  }
}


