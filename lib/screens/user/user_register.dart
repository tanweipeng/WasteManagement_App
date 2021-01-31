import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/ui/curve_painter.dart';

class UserRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    TextEditingController _editingController = TextEditingController();

    Column loginPart = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text("User Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: _editingController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: _editingController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
            obscureText: true,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: _editingController,
            decoration: InputDecoration(
              labelText: "Confirm Password",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 150,
            height: 50,
            onPressed: () {},
            color: Color(0xFFA1D8FF),
            child: Text('Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            // textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned.fill(child: CustomPaint(painter: CurvePainter(),)),
              IconButton(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: 40,),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icon/apps_icon.png", height: 200,),
                  Text("Solid Waste Management", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: loginPart,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}