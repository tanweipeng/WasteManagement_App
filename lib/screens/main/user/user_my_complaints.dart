import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/complaint/complaint.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/screens/main/user/user_my_complaints_status.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserMyComplaints extends StatefulWidget {
  @override
  _UserMyComplaints createState() => _UserMyComplaints();
}

class _UserMyComplaints extends State<UserMyComplaints> {
  Data d = Data.getInstance();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Column cardList = Column(
      children: [
        for (Complaint complaint in d.userComplaint)
          Container(
            padding: EdgeInsets.fromLTRB(
              10 * widthRatio,
              10 * heightRatio,
              10 * widthRatio,
              10 * heightRatio,
            ),
            margin: EdgeInsets.fromLTRB(
              30 * widthRatio,
              20 * heightRatio,
              30 * widthRatio,
              0,
            ),
            decoration: mainContainerBGBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String complaintKey
                    in complaint.getBinDataForUser().keys.toList())
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            2 * heightRatio,
                            0,
                            0,
                          ),
                          child: Text(
                            complaintKey,
                            style: TextStyle(
                              color: wordAndIconBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * widthRatio,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10 * widthRatio,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text(
                            complaint.getBinDataForUser()[complaintKey],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18 * widthRatio,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    2 * heightRatio,
                    0,
                    0,
                  ),
                  child: Text(
                    sStatus,
                    style: TextStyle(
                      color: wordAndIconBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * widthRatio,
                    ),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserMyComplaintsStatus(
                          complaint: complaint,
                        ),
                      ),
                    );
                  },
                  color:
                      complaint.status == sCompleted ? buttonGreen : buttonBlue,
                  child: Text(
                    complaint.status,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18 * widthRatio,
                    ),
                  ),
                  // textColor: Colors.black,
                ),
              ],
            ),
          ),
        SizedBox(
          height: 30 * heightRatio,
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          BackgroundPainter(),
          (d.userComplaint.length < 2)
              ? Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 50 * heightRatio,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                              Text(
                                sMyComplaints,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24 * widthRatio,
                                ),
                              ),
                              (d.userComplaint.length != 0)
                                  ? Container(
                                      width: screenWidth,
                                      child: cardList,
                                    )
                                  : Container(
                                      width: screenWidth,
                                      margin: EdgeInsets.fromLTRB(
                                        40 * widthRatio,
                                        20 * heightRatio,
                                        40 * widthRatio,
                                        40 * heightRatio,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                        10 * widthRatio,
                                        20 * heightRatio,
                                        10 * widthRatio,
                                        20 * heightRatio,
                                      ),
                                      decoration: mainContainerBGBoxDecoration,
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Icon(
                                              Icons.info,
                                              size: 45 * heightRatio,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                              sNoComplaintAvailableAtTheMoment,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24 * widthRatio,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      ArrowBackPop(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 50 * heightRatio,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                                Text(
                                  sMyComplaints,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24 * widthRatio,
                                  ),
                                ),
                                Container(
                                  width: screenWidth,
                                  child: cardList,
                                ),
                              ],
                            ),
                          ],
                        ),
                        ArrowBackPop(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
