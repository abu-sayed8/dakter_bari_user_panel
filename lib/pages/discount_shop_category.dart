import 'package:flutter/material.dart';
import 'package:users_panel/pages/subpage/discount_shop_list.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class DiscountShop extends StatefulWidget {
  @override
  _DiscountShopState createState() => _DiscountShopState();
}

class _DiscountShopState extends State<DiscountShop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color(0xffF4F7F5),
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Discount Shop'),
      body: _bodyUI(size),
    );
  }
  Widget _bodyUI(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width,
      height: size.height,
      child:Container(
            width: size.width,
            height: size.height * .49,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  //childAspectRatio: .95
                ),
                itemCount: 11,
                itemBuilder: (context, index) {
                  return GridBuilderTile(size, index);
                }),
          ),
    );
  }
}

// ignore: must_be_immutable
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
              builder: (context) => DiscountShopList(categoryName:'Lab')))
          : index == 2
          ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => DiscountShopList(categoryName:'Pharmacy')))
          : index == 3
          ? Navigator.push(context,
          MaterialPageRoute(builder: (context) => DiscountShopList(categoryName:'EnterTainment')))
          : index == 4
          ? Navigator.push(context,
          MaterialPageRoute(builder: (context) => DiscountShopList(categoryName:'Restaurant')))
          : index == 5
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Travel & Tour')))
          : index == 6
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Education & Training')))
          : index == 7
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Wedding')))
          : index == 8
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Shopping')))
          : index == 9
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Demand Service')))
          : index == 10
          ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Automobiles')))
          :  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscountShopList(categoryName:'Hospital'))),
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
                          ? AssetImage('assets/discount_shop/lab.png')
                          : index == 2
                          ? AssetImage('assets/discount_shop/pharmacy.png')
                          : index == 3
                          ? AssetImage('assets/discount_shop/entertainment.png')
                          : index == 4
                          ? AssetImage('assets/discount_shop/restaurant.png')
                          : index == 5
                          ? AssetImage('assets/discount_shop/travelandtour.png')
                          : index == 6
                          ? AssetImage('assets/discount_shop/education.png')
                          : index == 7
                          ? AssetImage('assets/discount_shop/wedding.png')
                          : index == 8
                          ? AssetImage('assets/home_icon/shopping.png')
                          : index == 9
                          ? AssetImage('assets/discount_shop/servicedemand.png')
                          : index == 10
                          ? AssetImage('assets/discount_shop/automobile.png')
                          : AssetImage(
                          'assets/discount_shop/hospital.png'),
                    ),
                  ),
                  height: 40,
                  width: 40,
                ),
              ]),
              SizedBox(height: 5),
              Text(
                index == 1
                    ? 'Lab'
                    : index == 2
                    ? 'Pharmacy'
                    : index == 3
                    ? ' Entertainment'
                    : index == 4
                    ? 'Restaurant'
                    : index == 5
                    ? 'Travel & Tour'
                    : index == 6
                    ? 'Education & Training'
                    : index == 7
                    ? 'Wedding'
                    : index == 8
                    ? 'Shopping'
                    : index == 9
                    ? 'Demand Service'
                    : index == 10
                    ? 'Automobiles'
                    : 'Hospital',
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

