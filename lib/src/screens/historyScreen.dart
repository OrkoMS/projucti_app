import 'package:flutter/material.dart';
import 'package:projucti_app/src/common/colors.dart';
import 'package:projucti_app/src/common/reusableComponents/raisedGradientButton.dart';

class HistoryScreen extends StatefulWidget {

  HistoryScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  var _updateMessageTitleTextController = TextEditingController();
  var _updateMessageBodyTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [

            Container(
              padding: EdgeInsets.only(left: 25,right: 25,top: 20),
              margin: EdgeInsets.only(bottom: 40),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 20,right: 20,top: 18,bottom: 18),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5),width: 1),
                        color: containerBgColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "History Title",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: backgroundColor,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              "History Details",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            Positioned(
              right: 18,
              bottom: 40,
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: inactiveSubmitButtonColor,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            content: addUpdateTemplateContainer(_height,_width),
                          );
                        }
                    );

                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Add",
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
          ],
        ),
      ),
    );
  }
  Widget addUpdateTemplateContainer(double height,double width) {
    return Container(
      width: width-100,
      child: Stack(
        children: [
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Add History",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: titleTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(7),
                  ),
                  child: Material(
                    elevation: 4,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter History title",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: textFieldHintColor,
                            fontFamily: 'Poppins'),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _updateMessageTitleTextController,
                      //onSaved: (value)=>_phoneNumber=value,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(7),
                  ),
                  child: Material(
                    elevation: 4,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter History details",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: textFieldHintColor,
                            fontFamily: 'Poppins'),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _updateMessageBodyTextController,
                      //onSaved: (value)=>_phoneNumber=value,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedGradientButton(
                  height: height / 16,
                  gradient: LinearGradient(
                    colors: <Color>[customerNameTextColor, inactiveSubmitButtonColor],
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                  onPressed: () async{
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}