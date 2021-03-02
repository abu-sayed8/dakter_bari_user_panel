import 'package:flutter/material.dart';
import 'package:users_panel/utils/custom_clipper.dart';
class CreditAssesment extends StatefulWidget {
  @override
  _CreditAssesmentState createState() => _CreditAssesmentState();
}

class _CreditAssesmentState extends State<CreditAssesment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      backgroundColor: Color(0xffF4F7F5),
      appBar: _customAppBar(),
      body: _bodyUI(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Theme.of(context).primaryColor,
      //   elevation: 2,
      //   tooltip: "Credit Assesment",
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 35,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
  Widget _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
        title: Text(
          'Credit Assesment',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: MyCustomClipperForAppBar(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Color(0xffBCEDF2),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  tileMode: TileMode.clamp,
                )),
          ),
        ),
        actions: [
          IconButton(
            splashColor: Theme.of(context).primaryColor,
            splashRadius: 20,
            icon: Icon(
              Icons.search_rounded,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      //padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Center(
        child: Text("Don't Have Any Credit Assesment Now"),
      ),
    );
  }

}

