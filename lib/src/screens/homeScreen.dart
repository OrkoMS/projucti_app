import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projucti_app/src/common/colors.dart';
import 'package:projucti_app/src/common/screens/loginScreen.dart';
import 'package:projucti_app/src/repository/addressSearch.dart';
import 'package:projucti_app/src/repository/authRepo.dart';
import 'package:projucti_app/src/repository/locationRepo.dart';
import 'package:projucti_app/src/screens/historyScreen.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentLocationTextController = TextEditingController();
  var _setLocationTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _currentLocationTextController.dispose();
    _setLocationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 18,
            top: 45,
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    primary: inactiveSubmitButtonColor,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                onPressed: () async{
                  ProjuctiAuthService projuctiAuthService =ProjuctiAuthService();
                  await projuctiAuthService.logout();
                  Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: LoginScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: titleTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(

            child: Container(
              padding: EdgeInsets.only(left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration:new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(7)
                          ),
                          child: Material(
                            elevation: 4,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                labelText: "Current Location",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                ),
                                focusedBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 25),
                                  child: IconButton(

                                      icon: Icon(Icons.location_on),

                                  ),
                                ),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: textFieldHintColor,
                                    fontFamily: 'Poppins'),
                              ),
                              keyboardType: TextInputType.text,
                              //onSaved: (value)=>_password=value,
                              controller: _currentLocationTextController,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(

                            elevation: 5,
                            primary: inactiveSubmitButtonColor,
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async{
                          LocationRepo locationRepo = LocationRepo();

                          var currentLoc= await locationRepo.determinePosition();

                          setState(() {
                            _currentLocationTextController.text=currentLoc;
                          });
                          //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.location_searching_rounded,color: titleTextColor,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Container(
                    decoration:new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(7)
                    ),
                    child: Material(
                      elevation: 4,
                      child: TextFormField(
                        onTap: ()async{
                          final sessionId= Uuid().v4();
                          final result = await showSearch(
                            context: context,
                            delegate: AddressSearch(sessionId),
                          );
                          setState(() {
                            _setLocationTextController.text=result.toString();
                          });
                          LocationRepo locationRepo =LocationRepo();
                          locationRepo.scheduleAlarm(_currentLocationTextController.text, _setLocationTextController.text);
                          //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen2()));

                        },
                        decoration: InputDecoration(
                          labelText: "Set Location",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 25),
                            child: IconButton(

                              icon: Icon(Icons.location_on),

                            ),
                          ),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: textFieldHintColor,
                              fontFamily: 'Poppins'),
                        ),
                        keyboardType: TextInputType.text,
                        //onSaved: (value)=>_password=value,
                        controller: _setLocationTextController,
                      ),
                    ),
                  ),
                  SizedBox(height: 36,),
                  SizedBox(
                    width: _width,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: inactiveSubmitButtonColor,
                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: HistoryScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Set History",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: titleTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}