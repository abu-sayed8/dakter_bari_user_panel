import 'package:flutter/material.dart';
import 'package:users_panel/pages/subpage/doctor_list.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class MedicalDepartment extends StatefulWidget {
  @override
  _MedicalDepartmentState createState() => _MedicalDepartmentState();
}

class _MedicalDepartmentState extends State<MedicalDepartment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color(0xffF4F7F5),
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Medical Department'),
      body: _bodyUI(size),
    );
  }
  Widget _bodyUI(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width,
      height: size.height,
      child: Container(
            width: size.width,
            height: size.height * .90,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  //childAspectRatio: .95
                ),
                itemCount: 39,
                itemBuilder: (context, index) {
                  return GridBuilderTile(size, index);
                }),
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
              builder: (context) => Doctor()))
          : index == 2
          ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => Doctor()))
          : index == 3
          ? Navigator.push(context,
          MaterialPageRoute(builder: (context) => Doctor()))
          : index == 4
          ? Navigator.push(context,
          MaterialPageRoute(builder: (context) => Doctor()))
          : index == 5
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 6
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 7
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 8
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 9
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 10
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 11
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 12
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 13
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 14
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 15
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 16
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 17
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 18
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 19
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 20
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 21
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 22
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 23
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 24
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 25
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 26
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 27
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 28
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 29
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 30
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 31
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 32
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 33
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 34
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 35
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 36
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 37
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          : index == 38
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor()))
          :  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Doctor())),
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
                          ? AssetImage('assets/medical_category/cardio_vascular_surgery.png')
                          : index == 2
                          ? AssetImage('assets/medical_category/cardio_thoracic_surgery.png')
                          : index == 3
                          ? AssetImage('assets/medical_category/cardiology.png')
                          : index == 4
                          ? AssetImage('assets/medical_category/dermatology.png')
                          : index == 5
                          ? AssetImage('assets/medical_category/dentist.png')
                          : index == 6
                          ? AssetImage('assets/medical_category/colorectal_surgery.png')
                          : index == 7
                          ? AssetImage('assets/medical_category/diabetes.png')
                          : index == 8
                          ? AssetImage('assets/medical_category/general_practitioner.png')
                          : index == 9
                          ? AssetImage('assets/medical_category/eye.png')
                          : index == 10
                          ? AssetImage('assets/medical_category/gastroenterology.png')
                          : index == 11
                          ? AssetImage('assets/medical_category/ent.png')
                          : index == 12
                          ? AssetImage('assets/medical_category/general_surgery.png')
                          : index == 13
                          ? AssetImage('assets/medical_category/gynecology.png')
                          : index == 14
                          ? AssetImage('assets/medical_category/hematology.png')
                          : index == 15
                          ? AssetImage('assets/medical_category/herbal.png')
                          : index == 16
                          ? AssetImage('assets/medical_category/medicine.png')
                          : index == 17
                          ? AssetImage('assets/medical_category/pain_medicine.png')
                          : index == 18
                          ? AssetImage('assets/medical_category/neurosurgery.png')
                          : index == 19
                          ? AssetImage('assets/medical_category/neuro_medicine.png')
                          : index == 20
                          ? AssetImage('assets/medical_category/nutrition.png')
                          : index == 21
                          ? AssetImage('assets/medical_category/oncology.png')
                          : index == 22
                          ? AssetImage('assets/medical_category/pediatrics.png')
                          : index == 23
                          ? AssetImage('assets/medical_category/nephrology.png')
                          : index == 24
                          ? AssetImage('assets/medical_category/orthopaedic.png')
                          : index == 25
                          ? AssetImage('assets/medical_category/physical_medicine.png')
                          : index == 26
                          ? AssetImage('assets/medical_category/physiotherapy.png')
                          : index == 27
                          ? AssetImage('assets/medical_category/plastic_surgery.png')
                          : index == 28
                          ? AssetImage('assets/medical_category/general_physician.png')
                          : index == 29
                          ? AssetImage('assets/medical_category/skin.png')
                          : index == 30
                          ? AssetImage('assets/medical_category/sonology.png')
                          : index == 31
                          ? AssetImage('assets/medical_category/urology.png')
                          : index == 32
                          ? AssetImage('assets/medical_category/vascular-surgery.png')
                          : index == 33
                          ? AssetImage('assets/medical_category/detician.png')
                          : index == 34
                          ? AssetImage('assets/medical_category/ophthalmology.png')
                          : index == 35
                          ? AssetImage('assets/medical_category/orthodontist.png')
                          : index == 36
                          ? AssetImage('assets/medical_category/psychiatrist.png')
                          : index == 37
                          ? AssetImage('assets/medical_category/psycologist.png')
                          : index == 38
                          ? AssetImage('assets/medical_category/respiratory_medicine.png')
                          : AssetImage('assets/medical_category/coronavirus.png'),
                    ),
                  ),
                  height: 40,
                  width: 40,
                ),
              ]),
              SizedBox(height: 5),
              Text(
                index == 1
                    ? 'Cardio-Vascular surgery'
                    : index == 2
                    ? 'Cardio Thoracic Surgery'
                    : index == 3
                    ? 'Cardiologist'
                    : index == 4
                    ? 'Dermatology'
                    : index == 5
                    ? 'Dentistry'
                    : index == 6
                    ? 'Colorectal Surgery(Piles)'
                    : index == 7
                    ? 'Diabetes & Endocrinology'
                    : index == 8
                    ? 'General Practitioner'
                    : index == 9
                    ? 'EYE'
                    : index == 10
                    ? 'Gestroenterology'
                    : index == 11
                    ? 'Eye,Nose,Ear (ENT) Specialist'
                    : index == 12
                    ? 'General Surgery'
                    : index == 13
                    ? 'Gynecology'
                    : index == 14
                    ? 'Hematology'
                    : index == 15
                    ? 'Herbal'
                    : index == 16
                    ? 'Medicine'
                    : index == 17
                    ? 'Pain Medicine'
                    : index == 18
                    ? 'Neuro-surgery'
                    : index == 19
                    ? 'Neuromedicine'
                    : index == 20
                    ? 'Nutritionest'
                    : index == 21
                    ? 'Oncology (Cancer)'
                    : index == 22
                    ? 'Pediatrics (CHILD)'
                    : index == 23
                    ? 'Nephrology (Kidney)'
                    : index == 24
                    ? 'Orthopaedic'
                    : index == 25
                    ? 'Physical Medicine'
                    : index == 26
                    ? 'Physiotherapy'
                    : index == 27
                    ? 'Plastic Surgery'
                    : index == 28
                    ? 'General Physician'
                    : index == 29
                    ? 'Skin & VD'
                    : index == 30
                    ? 'Sonology'
                    : index == 31
                    ? 'Urology'
                    : index == 32
                    ? 'Vascular Surgery'
                    : index == 33
                    ? 'Dietician'
                    : index == 34
                    ? 'Opthalmologist'
                    : index == 35
                    ? 'Orthodontist'
                    : index == 36
                    ? 'Psychiatrist'
                    : index == 37
                    ? 'Psycologist'
                    : index == 38
                    ? 'Respiratory Medicine'
                    : 'COVID-19 (corona virus)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, //Color(0xff00C5A4),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}

