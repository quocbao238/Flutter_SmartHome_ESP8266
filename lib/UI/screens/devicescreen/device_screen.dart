import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/UI/customs/colorHelper.dart';
import 'package:smarthome/UI/customs/sizeHelper.dart';
import 'package:smarthome/UI/screens/define_config/define.dart';
import 'package:smarthome/models/device.dart';


class DevicesScr extends StatefulWidget {
  @override
  _DevicesScrState createState() => _DevicesScrState();
}

class _DevicesScrState extends State<DevicesScr> {
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TIttle
              Container(
                margin: EdgeInsets.only(
                    top: padding * 1.5, left: padding, right: padding),
                height: height * 0.6 / 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        // color: Colors.red,
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.arrow_back,
                          color: circleEnable,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Text(
                      "All Devices",
                      style: GoogleFonts.rye(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontSize: 24.0),
                      ),
                    ),
                    SizedBox(width: 24.0),
                  ],
                ),
              ),

              //Body
              Container(
                margin: EdgeInsets.only(left: padding, right: padding),
                width: double.infinity,
                height: height * 8.6 / 10,
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Left List
                    Container(
                      width: (width - padding * 2) / 2 - padding,
                      child: ListView.builder(
                        itemCount: devices.length,
                        itemBuilder: (BuildContext context, int index) {
                          return devices[index].id % 2 != 0
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      devices[index].status =
                                          !devices[index].status;
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: padding * 2),
                                    height: height * 3.3 / 10,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(radius),
                                        color: containerColor),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: height * 2.2 / 10,
                                          // color: Colors.blue,
                                          child: Image(
                                            image: devices[index].status
                                                ? AssetImage(
                                                    'assets/lampon.png')
                                                : AssetImage(
                                                    'assets/lampoff.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.1 / 10,
                                        ),
                                        Text(
                                          "Lamp ${devices[index].id.toString()}",
                                          style: GoogleFonts.rye(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 1.0,
                                                fontSize: 24.0),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          devices[index].status
                                              ? "ON"
                                              : "OFF",
                                          style: GoogleFonts.rye(
                                            textStyle: TextStyle(
                                                color: devices[index].status
                                                    ? textenableColor
                                                    : textdisableColor,
                                                letterSpacing: 1.0,
                                                fontSize: 24.0),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container();
                        },
                      ),
                    ),

                    //
                    Container(width: padding * 2),
                    //

                    // Right List
                    Container(
                      width: (width - padding * 2) / 2 - padding,
                      // color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          //Button
                          Container(
                            margin: EdgeInsets.only(top: height * 0.35 / 10),
                            height: height * 1 / 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                color: containerColor),
                            child: !deviceisOn
                                ?
                                //ON
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        deviceisOn = !deviceisOn;
                                      });
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 0,
                                          left: height * 0.1 / 10,
                                          bottom: 0,
                                          child: Container(
                                            width: ((width - padding * 2) / 2 -
                                                    padding) *
                                                1 /
                                                3,
                                            height: height * 0.4 / 10,
                                            // color: Colors.white,
                                            child: Center(
                                              child: Text(
                                                "OFF",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.rye(
                                                  textStyle: TextStyle(
                                                      color: deviceisOn
                                                          ? textenableColor
                                                          : textdisableColor,
                                                      letterSpacing: 1.0,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: height * 0.08 / 10,
                                          right: height * 0.08 / 10,
                                          bottom: height * 0.08 / 10,
                                          child: Container(
                                            width: ((width - padding * 2) / 2 -
                                                    padding) *
                                                1.8 /
                                                3,
                                            height: height * 0.4 / 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        radius),
                                                color: container2Color),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: padding / 4),
                                                    width: width * 1 / 10,
                                                    height: width * 1 / 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    radius),
                                                        color: circleEnable),
                                                    child: Center(
                                                        child: Icon(
                                                      Icons.power_settings_new,
                                                      size: 30.0,
                                                    )),
                                                  ),
                                                  Container(
                                                    width: width * 1 / 10,
                                                    height: width * 1 / 10,
                                                    child: Center(
                                                        child: Text("ON",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                GoogleFonts.rye(
                                                              textStyle: TextStyle(
                                                                  color: !deviceisOn
                                                                      ? textenableColor
                                                                      : textdisableColor,
                                                                  letterSpacing:
                                                                      1.0,
                                                                  fontSize:
                                                                      16.0),
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                :
                                // OFF
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        deviceisOn = !deviceisOn;
                                      });
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: height * 0.08 / 10,
                                          left: height * 0.08 / 10,
                                          bottom: height * 0.08 / 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        radius),
                                                color: container2Color),
                                            width: ((width - padding * 2) / 2 -
                                                    padding) *
                                                1.8 /
                                                3,
                                            height: height * 0.4 / 10,
                                            // color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: padding / 4),
                                                  width: width * 1 / 10,
                                                  height: width * 1 / 10,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              radius),
                                                      color: circleEnable),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.power_settings_new,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: width * 1 / 10,
                                                  height: width * 1 / 10,
                                                  child: Center(
                                                    child: Text(
                                                      "OFF",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.rye(
                                                        textStyle: TextStyle(
                                                            color: deviceisOn
                                                                ? textenableColor
                                                                : textdisableColor,
                                                            letterSpacing: 1.0,
                                                            fontSize: 16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: height * 0.08 / 10,
                                          right: height * 0.08 / 10,
                                          bottom: height * 0.08 / 10,
                                          child: Container(
                                            width: ((width - padding * 2) / 2 -
                                                    padding) *
                                                1.8 /
                                                3,
                                            height: height * 0.4 / 10,
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: padding / 4),
                                                    width: width * 1 / 10,
                                                    height: width * 1 / 10,
                                                  ),
                                                  Container(
                                                    width: width * 1 / 10,
                                                    height: width * 1 / 10,
                                                    child: Center(
                                                        child: Text("ON",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                GoogleFonts.rye(
                                                              textStyle: TextStyle(
                                                                  color: !deviceisOn
                                                                      ? textenableColor
                                                                      : textdisableColor,
                                                                  letterSpacing:
                                                                      1.0,
                                                                  fontSize:
                                                                      16.0),
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),

                          Container(
                            width: (width - padding * 2) / 2 - padding,
                            height: height * 7.25 / 10,
                            child: ListView.builder(
                              itemCount: devices.length,
                              itemBuilder: (BuildContext context, int index) {
                                return devices[index].id % 2 == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            devices[index].status =
                                                !devices[index].status;
                                          });
                                          print(
                                              "Select Lamp ${devices[index].id}");
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: padding * 2),
                                          height: height * 3.3 / 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(radius),
                                              color: containerColor),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: height * 2.2 / 10,
                                                // color: Colors.blue,
                                                child: Image(
                                                  image: devices[index]
                                                          .status
                                                      ? AssetImage(
                                                          'assets/lampon.png')
                                                      : AssetImage(
                                                          'assets/lampoff.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.1 / 10,
                                              ),
                                              Text(
                                                "Lamp ${devices[index].id.toString()}",
                                                style: GoogleFonts.rye(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      letterSpacing: 1.0,
                                                      fontSize: 24.0),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                devices[index].status
                                                    ? "ON"
                                                    : "OFF",
                                                style: GoogleFonts.rye(
                                                  textStyle: TextStyle(
                                                      color: devices[index]
                                                              .status
                                                          ? textenableColor
                                                          : textdisableColor,
                                                      letterSpacing: 1.0,
                                                      fontSize: 24.0),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
