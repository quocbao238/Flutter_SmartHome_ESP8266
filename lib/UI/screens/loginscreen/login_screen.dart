import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/UI/customs/colorHelper.dart';
import 'package:smarthome/UI/customs/sizeHelper.dart';
import 'package:smarthome/UI/screens/define_config/define.dart';
import 'package:smarthome/blocs/login_blocs/login_bloc.dart';
import 'package:smarthome/service/firebase/authenticate.dart';

class LoginScr extends StatefulWidget {
  @override
  _LoginScrState createState() => _LoginScrState();
}

class _LoginScrState extends State<LoginScr> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginBloc()..add(CheckUserEvent()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoadingState) {
          } else if (state is LoginSucessState) {
            print("Login sucess");
          } else if (state is LoginFailState) {
            print("Login Fail");
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: backgroundColor,
              body: state is! LoadingState
                  ? Stack(
                      children: <Widget>[
/* SmartH icon */
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(radius),
                                  bottomRight: Radius.circular(radius)),
                              color: Colors.black87.withOpacity(0.4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.dove,
                                  color: titleColor,
                                  size: 60.0,
                                ),
                                SizedBox(width: padding / 4),
                                Text(
                                  tittle,
                                  style: GoogleFonts.rye(
                                      textStyle: TextStyle(
                                          color: titleColor,
                                          letterSpacing: 1.0,
                                          fontSize: 60.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // top: height/2,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(padding),
                            height: height * 0.65,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(radius * 2),
                                    topRight: Radius.circular(radius * 2)),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: height * 0.3,
                                  margin: EdgeInsets.only(
                                      left: padding, top: padding),
                                  // color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Home",
                                        style: GoogleFonts.rye(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.0,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.05),
                                      Text(
                                        "Please login with Google Account to controller your Home",
                                        style: GoogleFonts.rye(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.0,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Text(
                                        "Simple Solutions for Complex Connections",
                                        style: GoogleFonts.rye(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.0,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(height: height * 0.02),
                                Container(
                                  height: height * 0.25,
                                  // color: Colors.blue,
                                  padding: EdgeInsets.only(
                                      top: padding,
                                      right: padding,
                                      left: padding),
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(GoogleOnClickEvent());
                                        },
                                        child: Container(
                                          height: height * 0.1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(radius),
                                            color: Colors.blueAccent,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Login with Google Account",
                                              style: TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: padding),
                                        height: height * 0.1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(radius),
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.blueAccent),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Create by Quoc Bao",
                                            style: TextStyle(
                                                fontSize: 24.0,
                                                color: Colors.blueAccent),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          "loading....",
                          style: TextStyle(fontSize: 40.0, color: Colors.red),
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
