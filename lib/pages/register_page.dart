import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_panel/home.dart';
import 'package:users_panel/pages/login_page.dart';
import 'package:users_panel/pages/subpage/terms_and_condition.dart';
import 'package:users_panel/providers/firebase_operation_provider.dart';
import 'package:users_panel/providers/reg_auth_provider.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/form_decoration.dart';
import 'package:users_panel/shared/static_variable_page.dart';
import 'package:users_panel/widgets/notification_widget.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController minController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minController = TextEditingController(text: '15 min');
  }

  void _initializePatientData(RegAuth regAuth){
    regAuth.patientDetails.takenTeleService=false;
    regAuth.patientDetails.phone='';
    regAuth.patientDetails.fullName='';
    regAuth.patientDetails.password='';
    regAuth.patientDetails.countryCode='';
    // _initializeDayTimeData(regAuth);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegAuth>(
      builder: (context, regAuth, child){
        if(regAuth.patientDetails.phone==null){
          _initializePatientData(regAuth);
        }
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor:Colors.white,
          //resizeToAvoidBottomInset: false,
          appBar: customAppBarDesign(context, "Register Now"),
          body:_BodyUI(context,regAuth),
          //bottomNavigationBar: _bottomNavigation(),
        );
      },
    );
  }
  Widget _BodyUI(BuildContext context, RegAuth regAuth) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(left: 20, right: 20),
      height: size.height,
      width: size.width,
      child: ListView(
        children: [
          Column(
            children: [
              Text(
                "Your phone number is not recognized yet.",
                style: TextStyle(
                    color: Colors.grey[700], fontSize: size.width / 21),
              ),
              Text(
                "Let us know basic details for registration.",
                style: TextStyle(
                    color: Colors.grey[700], fontSize: size.width / 21),
              ),
            ],
          ),
          SizedBox(height: size.width / 8),

          //Registration Form
          Container(
            padding:EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                //Mobile number with country code
                Container(
                  width: size.width,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F7F5),
                    borderRadius:  BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width:size.width*.35,
                          child: _countryCodePicker(regAuth)
                      ),
                      Container(
                          width:size.width*.58,
                          child: _textFieldBuilder('Phone Number',regAuth)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                //Full name
                _textFieldBuilder('Full Name',regAuth),
                SizedBox(height: size.width / 20),

                //Password
                _textFieldBuilder('Password',regAuth),
                SizedBox(height: size.width / 20),

                _dropDownBuilder('Select Gender',regAuth),
    SizedBox(height: size.width / 20),

                //T&C row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: regAuth.agreeChk,
                      onChanged: (bool checkedValue)=> regAuth.agreeChk = checkedValue,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("I've read & agree to this agreement",
                                  style: TextStyle(color: Colors.grey[700]))),
                          GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TermsAndCondition())),
                              child: Text(
                                " read...",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.width / 20),

                //Continue Button
                GestureDetector(
                  onTap: ()=>_checkValidity(regAuth),
                  child: Button(context, "Continue"),
                ),
                SizedBox(height: size.width / 15),

                //Back to sign in button
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn())),
                  child: Text(
                    "Back to sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.width / 20),
              ],
            ),
    )
    ]
    )
    );
  }

  Widget _dropDownBuilder(String hint,RegAuth regAuth){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffF4F7F5),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value:  regAuth.patientDetails.gender,

          hint: Text(hint,style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16)),
          items: StaticVariables.genderItems.map((gender){
            return DropdownMenuItem(
              child: Text(gender,style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,)),
              value: gender,
            );
          }).toList(),
          onChanged: (newValue){
            setState(() {
              regAuth.patientDetails.gender = newValue;
            });
          },

          dropdownColor: Colors.white,
        ),
      ),
    );
  }

  Widget _textFieldBuilder(String hint,RegAuth regAuth){
    return TextFormField(
      obscureText:hint=='Password'? regAuth.obscure:false,
      keyboardType: hint=='Phone Number'? TextInputType.phone
          :hint=='Full Name'?TextInputType.text
          :hint=='Password'?TextInputType.text
          :TextInputType.number,
      onChanged: (val){
        setState(() {
          hint=='Phone Number'? regAuth.patientDetails.phone=val
              :hint=='Full Name'? regAuth.patientDetails.fullName=val
              :hint=='Password'?regAuth.patientDetails.password=val
              :regAuth.patientDetails.teleFee=val;
        });
      },
      decoration: FormDecoration.copyWith(
          labelText: hint,
          hintStyle: TextStyle(fontSize: 14),
          fillColor: Color(0xffF4F7F5),
          prefixIcon:hint=='Full Name'?Icon(Icons.person_outline,size: 28)
              :hint=='Phone Number'?null
              :hint=='Password'?Icon(Icons.security_outlined)
              : null,

          suffixIcon: hint=='Password'? IconButton(
              icon: regAuth.obscure
                  ? Icon(Icons.visibility_off_rounded)
                  : Icon(Icons.remove_red_eye),
              onPressed: () =>
                  setState(() => regAuth.obscure = !regAuth.obscure)):null
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
  Future<void> _checkValidity(RegAuth regAuth) async{
    if(regAuth.patientDetails.takenTeleService){
      if(regAuth.patientDetails.phone.isNotEmpty && regAuth.patientDetails.fullName.isNotEmpty && regAuth.patientDetails.password.isNotEmpty &&
          regAuth.patientDetails.gender!=null ){
        if(regAuth.agreeChk){

          regAuth.loadingMgs = 'Please wait...';
          showLoadingDialog(context, regAuth);
          bool isRegistered= await regAuth.isPatientRegistered(regAuth.patientDetails.countryCode+regAuth.patientDetails.phone);
          if(!isRegistered){
            _OTPVerification(regAuth);
          }else{
            Navigator.pop(context);
            showSnackBar(_scaffoldKey,'A patient is registered with this phone number');
          }
        }else showSnackBar(_scaffoldKey,'Check agreement');
      }else showSnackBar(_scaffoldKey,'Complete all the required fields');
    }else{
      if(regAuth.patientDetails.phone.isNotEmpty && regAuth.patientDetails.fullName.isNotEmpty && regAuth.patientDetails.password.isNotEmpty &&
          regAuth.patientDetails.gender!=null ){
        if(regAuth.agreeChk){
          regAuth.loadingMgs = 'Please wait...';
          showLoadingDialog(context, regAuth);
          bool isRegistered= await regAuth.isPatientRegistered(regAuth.patientDetails.countryCode+regAuth.patientDetails.phone);
          if(!isRegistered){
            _OTPVerification(regAuth);
          }else{
            Navigator.pop(context);
            showSnackBar(_scaffoldKey,'A patient is registered with this phone number');
          }
        }else showSnackBar(_scaffoldKey,'Check agreement');
      }else showSnackBar(_scaffoldKey,'Complete all the required fields');
    }
  }

  Future<void> _OTPVerification(RegAuth regAuth)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
      phoneNumber: regAuth.patientDetails.countryCode+regAuth.patientDetails.phone,
      //Automatic verify....
      verificationCompleted: (PhoneAuthCredential credential) async{
        await _auth.signInWithCredential(credential).then((value) async{
          if(value.user!=null){
            bool result = await regAuth.registerUser(regAuth.patientDetails);
            if(result){
              Navigator.pop(context);
              Navigator.pop(context);
              regAuth.patientDetails =null;
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
            }
            else{
              Navigator.pop(context);
              Navigator.pop(context);
              showSnackBar(_scaffoldKey,'Error register patient. Try again');
            }
          }
        });
      },
      verificationFailed: (FirebaseAuthException e){
        if (e.code == 'invalid-phone-number') {
          Navigator.pop(context);
          showSnackBar(_scaffoldKey,'The provided phone number is not valid');
        }
      },
      codeSent: (String verificationId, int resendToken){
        regAuth.verificationCode = verificationId;
        Navigator.pop(context);
        _OTPDialog(regAuth);
      },
      codeAutoRetrievalTimeout: (String verificationId){
        regAuth.verificationCode = verificationId;
        Navigator.pop(context);
        _OTPDialog(regAuth);
      },
      timeout: Duration(seconds: 60),

    );
  }
  ///ptp provider
  void _OTPDialog(RegAuth regAuth){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            contentPadding: EdgeInsets.all(20),
            title: Text("Phone Verification", textAlign: TextAlign.center),
            content: Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      "We've sent OTP verification code on your given number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: FormDecoration.copyWith(
                        labelText: "Enter OTP here",
                        fillColor: Colors.grey[100],
                        prefixIcon: Icon(Icons.security)),
                  ),
                  SizedBox(height: 10),
                  Consumer<FirebaseOperation>(
                    builder: (context, operation, child){
                      return GestureDetector(
                        onTap: ()async{
                          regAuth.loadingMgs = 'Verifying OTP please wait...';
                          showLoadingDialog(context, regAuth);
                          try{
                            await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: regAuth.verificationCode, smsCode: _otpController.text)).then((value)async{
                              if(value.user!=null){
                                bool result = await regAuth.registerUser(regAuth.patientDetails);
                                if(result){
                                  //operation.clearDoctorList();
                                  await operation.getPatient(regAuth.patientDetails.countryCode+regAuth.patientDetails.phone).then((value){
                                    regAuth.patientDetails =null;
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                                  });
                                }
                                else{
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  showSnackBar(_scaffoldKey,'Error register patient. Try again');
                                }
                              }
                            });
                          }catch(e){
                            Navigator.pop(context);
                            Navigator.pop(context);
                            showSnackBar(_scaffoldKey,'Invalid OTP');
                          }
                        },
                        child: Button(context, 'Submit'),
                      );
                    },
                  ),
                  //SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "0:22 min left",
                  //       style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  //     ),
                  //     GestureDetector(
                  //         onTap: () {},
                  //         child: Text(
                  //           "RESEND OTP",
                  //           style: TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold,
                  //               color: Theme.of(context).primaryColor),
                  //         )),
                  //   ],
                  // )
                ],
              ),
            ),
          );
        });
  }

}