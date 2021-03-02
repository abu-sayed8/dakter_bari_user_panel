import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:users_panel/providers/firebase_operation_provider.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/form_decoration.dart';
import 'package:users_panel/shared/static_variable_page.dart';
import 'package:users_panel/widgets/notification_widget.dart';
class UpdateUserProfile extends StatefulWidget {
  @override
  _UpdateUserProfileState createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {

  // String date="";
  // DateTime _currentDate = new DateTime.now();
  // Future <Null> _selectDate(BuildContext context) async{
  //   final DateTime _selDate=await showDatePicker(
  //     context: context,
  //     initialDate: _currentDate,
  //     firstDate: DateTime(1920),
  //     lastDate: DateTime(2100),
  //   );
  //   setState(() {
  //     date=DateFormat("dd/MM/yyyy").format(_selDate);
  //   });
  //
  // }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _counter =0;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  void _initializeTextFormData(FirebaseOperation operation){
    setState(()=>_counter++);
    nameController.text = operation.patientList[0].fullName ?? '';
    phoneController.text = operation.patientList[0].id ?? '';
    emailController.text = operation.patientList[0].email ?? '';

    operation.patientDetails.fullName=operation.patientList[0].fullName ?? '';
    operation.patientDetails.email=operation.patientList[0].email ?? '';
    operation.patientDetails.country=operation.patientList[0].country ??'';
    operation.patientDetails.state=operation.patientList[0].state ??'';
    operation.patientDetails.city=operation.patientList[0].city ??'';
    operation.patientDetails.address=operation.patientList[0].address ?? '';

  }
  @override
  Widget build(BuildContext context) {
    FirebaseOperation operation = Provider.of<FirebaseOperation>(context);
    if(_counter==0)_initializeTextFormData(operation);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, "Update Profile"),
      body:_bodyUI(),
    );
  }
  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    FirebaseOperation operation = Provider.of<FirebaseOperation>(context);
    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///Account Section...
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              height: size.height * .25,
              width: size.width,
              child: Row(
                children: [
                  ///Profile Picture
                  Container(
                    width: size.width * .46,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffAAF1E8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: operation.patientList[0].imageUrl==null? Image.asset("assets/male.png", width: 150)
                        :ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl: operation.patientList[0].imageUrl,
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: size.width * .46,
                        height: size.height * .25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  ///Update Profile Image
                  Container(
                    width: size.width * .42,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: InkWell(
                      onTap: (){
                        _getImageFromGallery(operation);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 3,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                              child: Icon(
                                Icons.camera,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              )),
                          SizedBox(height: size.width / 40),
                          Text(
                            "Change Image",
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Doctor Details
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: size.width / 20),
                  _buildTextForm("Full name", Icons.person,operation),
                  SizedBox(height: size.width / 20),
                  _buildTextForm("Email address", Icons.mail,operation),
                  SizedBox(height: size.width / 20),
                  _dropDownBuilder('Select blood Group',operation),
                  SizedBox(height: size.width / 20),

                  ///Address builder
                  Container(
                      width: size.width,
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color: Color(0xffF2F8F4),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address',style: TextStyle(fontSize: 12,color: Colors.grey[700])),
                          SizedBox(height: 5),
                          Text(
                            '${operation.patientList[0].country??'Country'}, ${operation.patientList[0].state??'State'}, ${operation.patientList[0].city??'City'}',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: size.width / 20),
                ],
              ),
            ),

            ///Country, State, City picker
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xffF2F8F4),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change Address',style: TextStyle(fontSize: 12,color: Colors.grey[700])),
                    SelectState(
                      dropdownColor:Colors.white,
                      style: TextStyle(color: Color(0xff008D74),fontWeight: FontWeight.w500),
                      onCountryChanged: (value) {
                        setState(() {
                          operation.patientDetails.country = value;
                        });
                      },
                      onStateChanged:(value) {
                        setState(() {
                          operation.patientDetails.state = value;
                        });
                      },
                      onCityChanged:(value) {
                        setState(() {
                          operation.patientDetails.city = value;
                        });
                      },
                    ),
                  ],
                )
            ),
            SizedBox(height: size.width / 20),

            ///Update button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: (){
                    operation.loadingMgs = 'Updating information...';
                    showLoadingDialog(context,operation);
                    operation.updatePatientInformation(operation,_scaffoldKey, context);
                  },
                  splashColor: Colors.cyan[200],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: bigOutlineIconButton(context, Icons.update, 'Update Information', Theme.of(context).primaryColor)),
            ),
            SizedBox(height: size.width / 40),
          ],
        ),
      ),
    );
  }
  // Widget _bodyUi(){
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 10),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //
  //         Container(
  //           padding: EdgeInsets.symmetric(vertical: 10.0),
  //           child: Container(
  //             width: MediaQuery.of(context).size.width * 0.95,
  //             decoration: BoxDecoration(
  //               color: Color(0xffF4F7F5),
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   child: IconButton(
  //                     onPressed: () {},
  //                     splashColor: Color(0xff00C5A4),
  //                     icon: Icon(
  //                       Icons.person,
  //                       color: Color(0xff00C5A4),
  //                     ),
  //                     iconSize: 100.0,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10.0),
  //                 Container(
  //                   child: Text(
  //                     "Select Profile Picture",
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: Color(0xff00C5A4),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: 10.0),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: userFormInput("Phone", ":", "Phone Number..."),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: userFormInput("Name", ":", "Name..."),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: userFormInput("NID", ":", "NID..."),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
  //             decoration: BoxDecoration(
  //                 color: Color(0xffF4F7F5),
  //                 borderRadius: BorderRadius.circular(10.0)
  //             ),
  //
  //             width: MediaQuery.of(context).size.width * 0.95,
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
  //                   width: MediaQuery.of(context).size.width * 0.23,
  //                   child: Text("Date of Birth",style: simpleTextStyle()),
  //                 ),
  //                 Container(
  //                   width: MediaQuery.of(context).size.width*0.02,
  //                   child: Text(":",style: colonTextStyle()),
  //                 ),
  //                 GestureDetector(
  //                   child: Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
  //                     color: Color(0xffF4F7F5),
  //                     width: MediaQuery.of(context).size.width*0.60,
  //                     child: Text(date,style: simpleTextStyle(),),
  //                   ),
  //                   onTap: (){
  //                     _selectDate(context);
  //                   },
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
  //             decoration: BoxDecoration(
  //                 color: Color(0xffF4F7F5),
  //                 borderRadius: BorderRadius.circular(10.0)
  //             ),
  //
  //             width: MediaQuery.of(context).size.width * 0.95,
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
  //                   width: MediaQuery.of(context).size.width * 0.23,
  //                   child: Text("Blood Group",style: simpleTextStyle()),
  //                 ),
  //                 Container(
  //                   width: MediaQuery.of(context).size.width*0.02,
  //                   child: Text(":",style: colonTextStyle()),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
  //                   width: MediaQuery.of(context).size.width*0.60,
  //                   child: DropdownButtonHideUnderline(
  //                     child: DropdownButton(
  //                       value: selectedBloodGroupCategory,
  //                       hint: Text("Select Blood Group",
  //                           style:
  //                           TextStyle(color: Colors.grey[700], fontSize: 16)),
  //                       items: _bloodGroup.map((category) {
  //                         return DropdownMenuItem(
  //                           child: Text(category,
  //                               style: TextStyle(
  //                                 color: Colors.grey[900],
  //                                 fontSize: 16,
  //                               )),
  //                           value: category,
  //                         );
  //                       }).toList(),
  //                       onChanged: (newValue) =>
  //                           setState(() => selectedBloodGroupCategory = newValue),
  //                       dropdownColor: Colors.white,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
  //             decoration: BoxDecoration(
  //                 color: Color(0xffF4F7F5),
  //                 borderRadius: BorderRadius.circular(10.0)
  //             ),
  //
  //             width: MediaQuery.of(context).size.width * 0.95,
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
  //                   width: MediaQuery.of(context).size.width * 0.23,
  //                   child: Text("Sex",style: simpleTextStyle()),
  //                 ),
  //                 Container(
  //                   width: MediaQuery.of(context).size.width*0.02,
  //                   child: Text(":",style: colonTextStyle()),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
  //                   width: MediaQuery.of(context).size.width*0.60,
  //                   child: DropdownButtonHideUnderline(
  //                     child: DropdownButton(
  //                       value: selectedSexCategory,
  //                       hint: Text("Select Sex Category",
  //                           style:
  //                           TextStyle(color: Colors.grey[700], fontSize: 16)),
  //                       items: _sexCategory.map((category) {
  //                         return DropdownMenuItem(
  //                           child: Text(category,
  //                               style: TextStyle(
  //                                 color: Colors.grey[900],
  //                                 fontSize: 16,
  //                               )),
  //                           value: category,
  //                         );
  //                       }).toList(),
  //                       onChanged: (newValue) =>
  //                           setState(() => selectedSexCategory = newValue),
  //                       dropdownColor: Colors.white,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
  //           child: userFormInput("Address", ":", "Address..."),
  //         ),
  //         Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  //             child: Container(
  //               height: 55,
  //               width: MediaQuery.of(context).size.width * 0.95,
  //               alignment: Alignment.center,
  //               child: Text("Update",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
  //               decoration: BoxDecoration(
  //                   color: Color(0xff00C5A4),
  //                   borderRadius: BorderRadius.circular(10.0)
  //               ),
  //             )
  //         ),
  //
  //         GestureDetector(
  //           onTap: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
  //           },
  //           child: Text("Log Out"),
  //         )
  //
  //       ],
  //     ),
  //   )
  // }

  Widget _buildTextForm(String hint, IconData prefixIcon, FirebaseOperation operation) {
    return TextFormField(
      maxLines: null,
      readOnly: hint=='Phone number'?true
          :false,

      controller: hint=='Full name'? nameController
          :hint=='Phone number'?phoneController
          :emailController,

      initialValue: null,
      decoration: FormDecoration.copyWith(
          alignLabelWithHint: true,
          labelText: hint,
          prefixIcon: Icon(prefixIcon),
          fillColor: Color(0xffF4F7F5)),
      keyboardType: TextInputType.text,
      onChanged: (value){
        if(hint=='Full name') operation.patientDetails.fullName=nameController.text;
        if(hint=='Email address') operation.patientDetails.email=emailController.text;
        },

    );
  }
  ///get image picker gelary
  Future<void> _getImageFromGallery(FirebaseOperation operation)async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      final File _image = File(pickedFile.path);
      operation.loadingMgs='Updating profile photo...';
      showLoadingDialog(context, operation);
      await operation.updatPatientProfilePhoto(_scaffoldKey,context, operation, _image);
    }else {
      showSnackBar(_scaffoldKey, 'No image selected');
    }

  }
  Widget _dropDownBuilder(String hint,operation){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffF4F7F5),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: operation.patientDetails.bloodGroup,
          hint: Text(hint,style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16)),
          items: StaticVariables.bloodGroupList.map((bloodGroup){
            return DropdownMenuItem(
              child: Text(bloodGroup,style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,)),
              value: bloodGroup,
            );
          }).toList(),
          onChanged: (newValue){
            setState(() {
              operation.patientDetails.bloodGroup=newValue;
            });
          },

          dropdownColor: Colors.white,
        ),
      ),
    );
  }
  // Widget userFormInput(String _labelText, String colonTxt,String textFieldHintText){
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 5.0),
  //     decoration: BoxDecoration(
  //         color: Color(0xffF4F7F5),
  //         borderRadius: BorderRadius.circular(10.0)
  //     ),
  //
  //     width: MediaQuery.of(context).size.width * 0.95,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
  //           width: MediaQuery.of(context).size.width * 0.23,
  //           child: Text(_labelText,style: simpleTextStyle()),
  //         ),
  //         Container(
  //           width: MediaQuery.of(context).size.width*0.02,
  //           child: Text(colonTxt,style: colonTextStyle()),
  //         ),
  //         Container(
  //           width: MediaQuery.of(context).size.width*0.60,
  //           child:  TextField(
  //             decoration: InputDecoration(
  //               hintText: textFieldHintText,
  //               enabledBorder: OutlineInputBorder(
  //                 borderSide: BorderSide.none,
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderSide: BorderSide.none,
  //               ),
  //
  //             ),
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }

}

