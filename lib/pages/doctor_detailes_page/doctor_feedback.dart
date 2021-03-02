import 'package:flutter/material.dart';
class DoctorFeedback extends StatefulWidget {
  @override
  _DoctorFeedbackState createState() => _DoctorFeedbackState();
}

class _DoctorFeedbackState extends State<DoctorFeedback> {
  static const Color starColor = Color(0xffFFBA00);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.topLeft,
        color: Colors.white,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Ratings Overview",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            _ratingsBuilder(5, 34),
            SizedBox(height: 10),
            _ratingsBuilder(4, 21),
            SizedBox(height: 10),
            _ratingsBuilder(3, 15),
            SizedBox(height: 10),
            _ratingsBuilder(2, 6),
            SizedBox(height: 10),
            _ratingsBuilder(1, 2),
            SizedBox(height: 30),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Total People Rated",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.assignment_ind,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '78',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800]),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Appointment Booked",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.playlist_add_check_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '129',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800]),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  Widget _ratingsBuilder(int rate, int amount) {
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

