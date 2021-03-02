import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/form_decoration.dart';
import 'package:users_panel/shared/widget.dart';

class AboutShopping extends StatefulWidget {
  @override
  _AboutShoppingState createState() => _AboutShoppingState();
}

class _AboutShoppingState extends State<AboutShopping> {

  Set<Marker> _marker = HashSet<Marker>();
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;
    setState(() {
      _marker.add(
          Marker(
            markerId: MarkerId('0'),
            position: LatLng(22.328135271666877, 91.81221409739933),
            infoWindow: InfoWindow(
                title: "Daktarbari",
                snippet: "Chottogram"
            ),
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, "About Shopping"),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        //DakterBari Image
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
              'assets/logo.png',
            )),
          ),
        ),
        SizedBox(height: 8.0),

        //Header Section
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DakterBari- A Healthcare App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("K.N.Tower(8th floor),Badamtali Circle 18 Agrabad C/A",
                style: TextStyle(color: Colors.grey[700],fontSize: 14)),
          ],
        )),
        SizedBox(height: 18),

        //about
        _aboutBuilder('About'),
        SizedBox(height: 18),

        _contactBuilder('Contact'),
        SizedBox(height: 18),

        _amenitiesBuilder('Amenities'),
        SizedBox(height: 18),

        _openingHoursBuilder('Opening Hours'),
        SizedBox(height: 18),

        _featureProductBuilder('Featured Products'),
        SizedBox(height: 18),

        _reviewBuilder('Reviews'),
        SizedBox(height: 18),

       _contactUsBuilder('Contuct Us'),
        SizedBox(height: 18),
        
        _locationBuilder('Location'),
        SizedBox(height: 18),
      ],
    );
  }

  Widget _headingBuilder(String heading){
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Color(0xffF4F7F5), borderRadius: BorderRadius.circular(5)),
      child: Text(heading,style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
    );
  }

  Widget _aboutBuilder(String about) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          _headingBuilder(about),
          SizedBox(height: 10),
          Text(
            "DakterBari is a flagship charity-cum-social business under"
                " Dialme Limited. aimed at building a healthful Bangladesh and improving"
                " the health ecosystem by using mobile technology ",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _contactBuilder(String contact){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          _headingBuilder(contact),
          SizedBox(height: 15),
          socialButton(context, 'assets/social_icon/email_48.png', 'Email Us', Color(0xffFFA500)),
          SizedBox(height: 10),
          socialButton(context, 'assets/social_icon/facebook_48.png', 'Facebook', Color(0xff4068E0)),
          SizedBox(height: 10),
          socialButton(context, 'assets/social_icon/globe_48.png', 'Visit Website', Color(0xffA6D785)),
          SizedBox(height: 10),
          socialButton(context, 'assets/social_icon/linkedin_48.png', 'LinkedIn', Color(0xff4069E1)),
          SizedBox(height: 10),
          socialButton(context, 'assets/social_icon/phone_48.png', 'Call Now', Color(0xffE0218A)),
          SizedBox(height: 10),
          socialButton(context, 'assets/social_icon/twitter_48.png', 'Twitter', Color(0xff42C0FB)),
        ],
      ),
    );
  }

  Widget _amenitiesBuilder(String amenities){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _headingBuilder(amenities),
          SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index){
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xffF4F7F5),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Outdoor Seating"),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _openingHoursBuilder(String heading){
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _headingBuilder(heading),
          SizedBox(height: 15),
          Row(
            children: [
              ///Day
              Container(
                width: size.width * .33,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saturday ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Sunday ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Monday ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Tuesday ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Wednesday ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("Thursday ", style: TextStyle(fontSize: 18)),
                    Text("Friday", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              ///Time
              Container(
                width: size.width * .55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18)),
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18)),
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18)),
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18),),
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18)),
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18)),
                    Text(" 09 am - 08 pm", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _featureProductBuilder(String heading){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          _headingBuilder(heading),
          SizedBox(height: 15),

          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return FeatureProductTile(
                productName: "Doctor App",
                productPrice: '\$40.0/each',
                productImage: "assets/dakterbariapp_logo.jpg",
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _reviewBuilder(String heading){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          _headingBuilder(heading),
          SizedBox(height: 15),

          RatingBuilderTile(rate:5, amount:34),
          SizedBox(height: 10),
          RatingBuilderTile(rate:4, amount:21),
          SizedBox(height: 10),
          RatingBuilderTile(rate:3, amount:15),
          SizedBox(height: 10),
          RatingBuilderTile(rate:2, amount:6),
          SizedBox(height: 10),
          RatingBuilderTile(rate:1, amount:4),

        ],
      ),
    );
  }

  Widget _contactUsBuilder(String heading){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          _headingBuilder('Contact Us'),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: shoppingFormInputDecoration("Name..."),
                  ),
                  SizedBox(height: 7),
                  TextFormField(
                    decoration: shoppingFormInputDecoration("Your message..."),
                    maxLines: 3,
                  ),
                  SizedBox(height: 7),
                  Container(
                    child: Button(context, "Submit"),
                  ),
                  SizedBox(height: 7),
                  Container(
                    child: whiteButton(context, "Add To Wishlist"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _locationBuilder(String heading){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          _headingBuilder(heading),
          SizedBox(height: 10),
          
          Container(
            height: MediaQuery.of(context).size.height * .50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(22.328135271666877, 91.81221409739933),
                  zoom: 15,
                ),
                markers: _marker,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class FeatureProductTile extends StatelessWidget {
  String productImage,productName,productPrice;
  FeatureProductTile({this.productImage,this.productName,this.productPrice});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
            width: size.width * .30,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(productImage))),
          ),
          Container(
            width: size.width * .60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: boldTextStyle(),
                      ),
                    ),
                    Text(
                      productPrice,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: Colors.black, height: 2),
              ],
            ),
          )
        ],
      );

  }
}

// ignore: must_be_immutable
class RatingBuilderTile extends StatelessWidget {
  int rate,amount;
  RatingBuilderTile({this.rate,this.amount});
  static const Color starColor = Color(0xffFFBA00);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              //color: Colors.red,
              child: Row(
                children: [
                  Text(
                    "$rate",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800]),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: starColor, size: 18)
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 13,
              width: rate == 5
                  ? size.width * .65
                  : rate == 4
                  ? size.width * .50
                  : rate == 3
                  ? size.width * .35
                  : rate == 2
                  ? size.width * .20
                  : size.width * .10,
              color: Theme.of(context).primaryColor,
              child: Text(""),
            )
          ],
        ),
        Text(
          "$amount",
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800]),
        )
      ],
    );
  }
}
