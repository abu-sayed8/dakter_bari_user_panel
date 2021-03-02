import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_panel/pages/subpage/about_shopping.dart';
import 'package:users_panel/shared/custom_app_bar.dart';

class DiscountShopList extends StatefulWidget {
  String categoryName;

  DiscountShopList({this.categoryName});

  @override
  _DiscountShopListState createState() => _DiscountShopListState();
}

class _DiscountShopListState extends State<DiscountShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, widget.categoryName),
      body: _bodyUI(),
    );
  }
}

Widget _bodyUI() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return DiscountShopTile(
        name: "DakterBari- A Healthcare App",
        about: "DakterBari is a flagship charity-cum-social business under Dialme"
            "Limited. aimed at building a healthful Bangladesh and improving the"
            "health ecosystem by using mobile technology.",
        location: "Chottogram, Bangladesh",
        review: "3",
        urlImage: "assets/dakterbariapp_logo.jpg",
      );
    },
  );
}

// ignore: must_be_immutable
class DiscountShopTile extends StatelessWidget {
  String name, about, location, review, lat, long, urlImage;
  static const Color starColor = Color(0xffFFBA00);

  DiscountShopTile(
      {this.about,
      this.name,
      this.lat,
      this.location,
      this.long,
      this.review,
      this.urlImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutShopping()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 10),
        decoration: BoxDecoration(
            color: Color(0xffF4F7F5),
            border: Border.all(
              color: Theme.of(context).primaryColor
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // boxShadow: [
            //   BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 2)
            // ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image Container
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, offset: Offset(0, 1), blurRadius: 2)
                    ]),
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  urlImage,
                  height: 180,
                  fit: BoxFit.fitHeight,
                )),
            //Content Container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Shop Name
                  Text(
                    name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  //Shop Location
                  Text(
                      location,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  //Shop About
                  Text(about,maxLines: 2,
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 15,)
                  ),
                  SizedBox(height: 10),

                  //Show Map Section
                  Row(
                    children: [
                      Icon(CupertinoIcons.compass,size: 20,color: Colors.grey,),
                      SizedBox(width: 5),
                      Text("Show On Map",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),)
                    ],
                  ),
                  //SizedBox(height: 10),

                  Divider(color: Theme.of(context).primaryColor,),
                  //Footer Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                        decoration:BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text("Open",style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                        ),),
                      ),

                      //Rating Section
                      Row(
                        children: [
                          Text(
                           "Ratings:",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5),
                          int.parse(review) == 5
                              ? Row(
                            children: [
                              Icon(Icons.star, size: 15, color: starColor),
                              Icon(Icons.star, size: 15, color: starColor),
                              Icon(Icons.star, size: 15, color: starColor),
                              Icon(Icons.star, size: 15, color: starColor),
                              Icon(Icons.star, size: 15, color: starColor),
                            ],
                          )
                              : int.parse(review) == 4
                              ? Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                            ],
                          )
                              : int.parse(review) == 3
                              ? Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                            ],
                          )
                              : int.parse(review) == 2
                              ? Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                            ],
                          )
                              : Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15, color: starColor),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
