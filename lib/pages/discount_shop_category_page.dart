// import 'package:flutter/material.dart';
// import 'package:user_panel/shared/custom_app_bar.dart';
//
// class DiscountShopCategory extends StatefulWidget {
//   @override
//   _DiscountShopCategoryState createState() => _DiscountShopCategoryState();
// }
//
// class _DiscountShopCategoryState extends State<DiscountShopCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: customAppBarDesign(context, "Update Profile"),
//       body:_bodyUI(),
//     );
//   }
//   Widget _bodyUI(){
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       child: ListView(
//         children: [
//           _dropDownBuilder('Select Gender',regAuth),
//           SizedBox(height: size.width / 20),
//           _dropDownBuilder('Select Speciality & Services',regAuth),
//           SizedBox(height: size.width / 20),
//         ],
//       ),
//     );
//   }
//   Widget _dropDownBuilder(String hint,RegAuth regAuth){
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
//       decoration: BoxDecoration(
//           color: Color(0xffF4F7F5),
//           borderRadius: BorderRadius.all(Radius.circular(10))
//       ),
//       width: MediaQuery.of(context).size.width,
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           value: hint=="Select Gender"? regAuth.doctorDetails.gender
//               : hint=="Select Currency"? regAuth.doctorDetails.currency
//               :regAuth.doctorDetails.specification,
//           hint: Text(hint,style: TextStyle(
//               color: Colors.grey[700],
//               fontSize: 16)),
//           items: hint=='Select Gender'?
//           StaticVariables.genderItems.map((gender){
//             return DropdownMenuItem(
//               child: Text(gender,style: TextStyle(
//                 color: Colors.grey[900],
//                 fontSize: 16,)),
//               value: gender,
//             );
//           }).toList()
//               :hint=='Select Currency'?
//           StaticVariables.currency.map((currency){
//             return DropdownMenuItem(
//               child: Text(currency,style: TextStyle(
//                 color: Colors.grey[900],
//                 fontSize: 16,)),
//               value: currency,
//             );
//           }).toList()
//           //for service category
//               :StaticVariables.serviceCategoryItems.map((category){
//             return DropdownMenuItem(
//               child: Text(category,style: TextStyle(
//                 color: Colors.grey[900],
//                 fontSize: 16,)),
//               value: category,
//             );
//           }).toList(),
//           onChanged: (newValue){
//             setState(() {
//               hint=="Select Gender"? regAuth.doctorDetails.gender = newValue
//                   :hint=="Select Currency"? regAuth.doctorDetails.currency = newValue
//                   :regAuth.doctorDetails.specification=newValue;
//             });
//           },
//
//           dropdownColor: Colors.white,
//         ),
//       ),
//     );
//   }
// }
