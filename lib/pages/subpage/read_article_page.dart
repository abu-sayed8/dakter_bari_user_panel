import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_panel/data/article_details_list.dart';
import 'package:users_panel/model/article_details_model.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
import 'package:users_panel/shared/form_decoration.dart';
// ignore: must_be_immutable
class ReadArticle extends StatefulWidget {
  String title;
  String date;
  String imageUrl;
  String description;
  int share;
  int like;

  ReadArticle(
      {this.description,
      this.title,
      this.imageUrl,
      this.date,
      this.share,
      this.like});

  @override
  _ReadArticleState createState() => _ReadArticleState();
}

class _ReadArticleState extends State<ReadArticle> {
  List<ArticleDetails> articleList = List<ArticleDetails>();

  @override
  void initState() {
    super.initState();
    articleList = getArticle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Cervical Cancer'),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _articleDetails(size),
          _divider(),
          _sectionHeading('Write your comment'),
          _writeComment(size),
          _divider(),
          _sectionHeading('All comments'),
          _commentSection(size),
          _commentSection(size),
          _commentSection(size),
          _commentSection(size),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("View more comments",textAlign: TextAlign.end,style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),),
          ),
          _divider(),
          _sectionHeading("Related Articles"),
          _relatedArticle(size),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _articleDetails(Size size) {
    return Column(
      children: [
        //Image Section...
        Container(
          height: size.width * .65,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage(widget.imageUrl), fit: BoxFit.cover)),
        ),
        SizedBox(height: 10),

        //Title Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 19,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),

        //Date, like, share Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.date_range, color: Theme.of(context).primaryColor),
                  SizedBox(width: 4),
                  Text(
                    widget.date,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.like}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.suit_heart,
                    color: Colors.pink,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${widget.share}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.arrowshape_turn_up_right,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10),

        //Writer Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/tom.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Dr. Somon Islam (MBBS, MSC)',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        //Description Section...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.description,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 13.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20),

        //Like & Share button...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){},
                splashColor: Colors.pink[200],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: outlineIconButton(
                    context, CupertinoIcons.suit_heart_fill, 'Like', Colors.pink),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: (){},
                splashColor: Colors.cyanAccent[200],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: outlineIconButton(
                    context,
                    CupertinoIcons.arrowshape_turn_up_right_fill,
                    "Share",
                    Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _divider() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Divider(
          color: Theme.of(context).primaryColor,
        ));
  }

  Widget _sectionHeading(String heading){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(heading,style: TextStyle(
          color: Colors.grey[600],
          fontSize: 17,
          fontWeight: FontWeight.w500),),
    );
  }

  Widget _writeComment(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10),

        ///Comment...
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            decoration: FormDecorationWithoutPrefix.copyWith(
              alignLabelWithHint: true,
                labelText: "Write here...", fillColor: Color(0xffF4F7F5)),
          ),
        ),
        SizedBox(height: 10),

        Container(
            width: size.width * .3,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.cyan[200],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: outlineIconButton(
                context,
                CupertinoIcons.bubble_right_fill,
                'Comment',
                Colors.cyan,
              ),
            )),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _commentSection(Size size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * .11,
            height: size.width * .11,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/tom.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          SizedBox(width: size.width * .01),
          Container(
            width: size.width * .82,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              "Hello dear Tom Cruise. How are you dear? I am your big fan. "
                  "This Article very informative for me",
              style: TextStyle(fontSize: 13, color: Colors.grey[900]),
            ),
          )
        ],
      ),
    );
  }

  Widget _relatedArticle(Size size){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 310,
      width: size.width,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: articleList.length,
            itemBuilder: (context, index) {
              return PostTile(
                title: articleList[index].title,
                date: articleList[index].date,
                imageUrl: articleList[index].imageUrl,
                share: articleList[index].share,
                like: articleList[index].like,
                desc: articleList[index].description,
              );
            })
    );
  }
}


// ignore: must_be_immutable
class PostTile extends StatelessWidget {
  String title, date, imageUrl,desc;
  int share, like;

  PostTile({this.title, this.date, this.imageUrl, this.like, this.share,this.desc});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadArticle(
            title: title,
            date: date,
            imageUrl: imageUrl,
            description: desc,
            share: share,
            like: like,
          ))),
      child: Container(
        width: 200,
        height: 310,
        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 2.5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 2.0, offset: Offset(0, 1))
            ]),
        child: Stack(
          children: [
            ///Image
            Positioned(
                top: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: AssetImage(imageUrl), fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(height: 5),

                    ///Title, date, description
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title...
                          Container(
                              width: 195,
                              child: Text(
                                title,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )),
                          SizedBox(height: 5),
                          //Vertical line
                          Container(
                            height: 3,
                            width: 100,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 5),
                          //Date...
                          Container(
                              width: 195,
                              child: Text(
                                date,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )),
                          SizedBox(height: 20),
                          //Description...
                          Container(
                              width: 195,
                              child: Text(
                                desc,
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    )
                  ],
                )),

            ///Footer (like & share)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$like",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.suit_heart,
                            color: Colors.pink,
                            size: 20,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$share",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.arrowshape_turn_up_right,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
