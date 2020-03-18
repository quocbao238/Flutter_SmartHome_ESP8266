import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/UI/customs/colorHelper.dart';
import 'package:smarthome/UI/customs/sizeHelper.dart';
import 'package:smarthome/UI/screens/define_config/define.dart';
import 'package:smarthome/UI/screens/devicescreen/device_screen.dart';
import 'package:smarthome/models/device.dart';
import 'package:smarthome/models/todo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
/* SmartH icon */

          Positioned(
            top: height * 0.5 / 10,
            right: 0,
            left: 0,
            child: Container(
              height: height * 0.5 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.dove,
                    color: titleColor,
                    size: 30.0,
                  ),
                  SizedBox(width: padding / 4),
                  Text(
                    tittle,
                    style: GoogleFonts.rye(
                        textStyle: TextStyle(
                            color: titleColor,
                            letterSpacing: 1.0,
                            fontSize: 30.0)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: padding * 2, right: padding * 2, top: padding * 1.5),
            child: Container(
              width: width,
              height: height,
              child: Row(
                children: <Widget>[
/* Left Screen */
                  Container(
                    margin: EdgeInsets.only(right: padding, bottom: padding),
                    width: width / 2 - padding * 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
/* Door Locked */
                        Container(
                          height: height * 3.2 / 9,
                          width: width / 2 - padding * 3,
                          padding:
                              EdgeInsets.only(left: padding, bottom: padding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(padding),
                              color: containerColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: height * 0.8 / 9,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: height * 0.8 / 9,
                                        width: height * 0.8 / 9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(radius * 2),
                                          color: Color.fromRGBO(66, 68, 73, 1),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.18 / 9,
                                      left: height * 0.18 / 9,
                                      bottom: height * 0.18 / 9,
                                      child: Container(
                                        height: height * 0.6 / 9,
                                        width: height * 0.4 / 9,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                radius * 2),
                                            color: Colors.black54),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.22 / 9,
                                      left: height * 0.22 / 9,
                                      bottom: height * 0.22 / 9,
                                      right: height * 0.15 / 9,
                                      child: Container(
                                        height: height * 0.4 / 9,
                                        width: height * 0.4 / 9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(radius),
                                          color: sliderColors,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: padding / 2),
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          height: height * 0.2 / 9,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Icon(
                                                Icons.lock,
                                                color: Colors.black87,
                                                size: 14.0,
                                              ),
                                              Text(
                                                " slide to unlock",
                                                style: GoogleFonts.rye(
                                                    textStyle: TextStyle(
                                                        color: iconColor,
                                                        fontSize: 8.0)),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: iconColor,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // child: Placeholder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.4 / 9,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: padding),
                                child: Center(
                                  child: Icon(
                                    Icons.fingerprint,
                                    size: 40.0,
                                    color: fingerprintColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.4 / 9,
                              ),
                              Text(
                                door,
                                style: GoogleFonts.rye(
                                    textStyle: TextStyle(
                                        color:
                                            Colors.grey[500].withOpacity(0.8),
                                        fontSize: 16.0)),
                              ),
                              Text(
                                doorisLock ? "locked" : "opened",
                                style: GoogleFonts.rye(
                                    textStyle: TextStyle(
                                        color: fingerprintColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.3 / 9,
                        ),

/* Temp & Fan */
                        Stack(
                          children: <Widget>[
                            Container(
                              height: height * 3.5 / 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(padding),
                                color: containerColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(padding / 4),
                              height: height * 2.5 / 9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(padding),
                                  color: container2Color),
                              // child: Placeholder(),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                margin: EdgeInsets.only(left: padding),
                                height: height * 0.65 / 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "thermostat",
                                      style: GoogleFonts.rye(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            color: textdisableColor,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                    Text(
                                      "ON",
                                      style: GoogleFonts.rye(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            color: textenableColor,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: padding / 4,
                                  right: padding / 4,
                                  // bottom: padding / 4,
                                  top: padding * 1.5),
                              height: height * 2 / 9,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: padding / 2),
                                    height: height * 1.0 / 9,
                                    // color: Colors.red,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          // color: Colors.red,
                                          child: AutoSizeText(
                                            "70",
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.rye(
                                              textStyle: TextStyle(
                                                  color: textdisableColor,
                                                  fontSize: 70.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: padding / 4),
                                        Container(
                                          width: width * 0.5 / 10,
                                          child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              SizedBox(
                                                height: height * 0.1 / 10,
                                              ),
                                              Text(
                                                "0",
                                                style: GoogleFonts.rye(
                                                    textStyle: TextStyle(
                                                        color: textdisableColor,
                                                        fontSize: 24.0)),
                                              ),
                                              Text("C",
                                                  style: GoogleFonts.rye(
                                                      textStyle: TextStyle(
                                                          color:
                                                              textdisableColor,
                                                          fontSize: 24.0))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: padding),
                                    height: height * 1 / 9,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.supervised_user_circle,
                                              size: 14.0,
                                              color: textdisableColor,
                                            ),
                                            SizedBox(width: padding / 2),
                                            Text("H - L Temp",
                                                style: GoogleFonts.rye(
                                                    textStyle: TextStyle(
                                                        color: textdisableColor,
                                                        fontSize: 14.0))),
                                          ],
                                        ),
                                        SizedBox(height: padding / 4),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: padding * 1.3),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                  "${temperatureLow.toString()} $celcius - ${temperatureLow.toString()}$celcius",
                                                  style: GoogleFonts.rye(
                                                      textStyle: TextStyle(
                                                          color:
                                                              textdisableColor,
                                                          fontSize: 14.0))),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: padding / 2),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.fan,
                                              size: 14.0,
                                              color: textdisableColor,
                                            ),
                                            SizedBox(width: padding / 2),
                                            Text(
                                                fanisRun
                                                    ? "FAN - ON "
                                                    : "FAN - OFF",
                                                style: GoogleFonts.rye(
                                                    textStyle: TextStyle(
                                                        // fontWeight: FontWeight.w100,
                                                        color: textdisableColor,
                                                        fontSize: 14.0))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

/* Right Screen */
                  Container(
                    margin: EdgeInsets.only(left: padding, bottom: padding),
                    width: width / 2 - padding * 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
/* Show Total: 5 Devices  */
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DevicesScr()),
                              );
                            });
                          },
                          child: Container(
                            height: height * 2.5 / 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(padding),
                                color: containerColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: height * 1.2 / 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * 0.4 / 10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            CircleEnable(
                                                height: height,
                                                color: devices[0].status
                                                    ? circleEnable
                                                    : circleDisable),
                                            CircleEnable(
                                                height: height,
                                                color: devices[1].status
                                                    ? circleEnable
                                                    : circleDisable),
                                            CircleEnable(
                                                height: height,
                                                color: devices[2].status
                                                    ? circleEnable
                                                    : circleDisable),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: height * 0.2 / 10),
                                      Container(
                                        height: height * 0.4 / 10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            CircleEnable(
                                                height: height,
                                                color: devices[3].status
                                                    ? circleEnable
                                                    : circleDisable),
                                            CircleEnable(
                                                height: height,
                                                color: devices[4].status
                                                    ? circleEnable
                                                    : circleDisable),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.2 / 10),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: padding,
                                  ),
                                  padding: EdgeInsets.only(top: padding / 2),
                                  height: height * 1 / 10,
                                  width: double.infinity,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${devices.length} devices",
                                          style: GoogleFonts.rye(
                                              textStyle: TextStyle(
                                                  color: textdisableColor,
                                                  fontSize: 16.0))),
                                      Text("ON",
                                          style: GoogleFonts.rye(
                                              textStyle: TextStyle(
                                                  // fontWeight: FontWeight.w100,
                                                  color: textenableColor,
                                                  fontSize: 18.0))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: height * 2 /,
                        // ),
                        SizedBox(
                          height: height * 0.3 / 10,
                        ),

/* To do List  */
                        Stack(
                          children: <Widget>[
                            Container(
                              height: height * 3.5 / 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(padding),
                                  color: containerColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: padding / 2,
                                      left: padding,
                                      right: padding,
                                    ),
                                    height: height * 0.5 / 10,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              todocount--;
                                              if (todocount < 0) {
                                                todocount = todos.length - 1;
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: height * 0.4 / 10,
                                            width: height * 0.4 / 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      radius / 2),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: circleEnable),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: circleEnable,
                                                size: 16.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 0.50,
                                          color: textdisableColor,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              todocount++;
                                              if (todocount >
                                                  todos.length - 1) {
                                                todocount = 0;
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: height * 0.4 / 10,
                                            width: height * 0.4 / 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      radius / 2),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: circleEnable),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: circleEnable,
                                                size: 16.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: padding / 2),
                                    padding: EdgeInsets.only(top: padding / 4),
                                    height: height * 0.5 / 10,
                                    // color: Colors.red,
                                    child: AutoSizeText(todos[todocount].work,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rye(
                                            textStyle: TextStyle(
                                                // fontWeight: FontWeight.w100,
                                                color: textdisableColor,
                                                fontSize: 16.0))),
                                  ),
                                ],
                              ),
                              // child: Placeholder(),
                            ),
                            Container(
                              margin: EdgeInsets.all(padding / 4),
                              height: height * 2.0 / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(padding),
                                image: DecorationImage(
                                    image: AssetImage(todos[todocount].image),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.3 / 10,
                        ),

/* More  */
                        Stack(
                          children: <Widget>[
                            Container(
                              height: height * 1.7 / 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(padding),
                                  color: containerColor),
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: padding * 2 / 2, left: padding),
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  "more",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rye(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        color: textdisableColor,
                                        fontSize: 14.0),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: height * 1.2 / 10,
                                child: Center(
                                  child: Icon(
                                    Icons.widgets,
                                    size: 30.0,
                                    color: textenableColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleEnable extends StatelessWidget {
  const CircleEnable({
    Key key,
    @required this.height,
    @required this.color,
  }) : super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height * 0.15 / 10,
      height: height * 0.15 / 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius * 2), color: color),
    );
  }
}
