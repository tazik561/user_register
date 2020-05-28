import 'package:flutter/material.dart';

import '../model/users_model.dart';

class UserDetailsPage extends StatelessWidget {
  final UsersModle model;

  const UserDetailsPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Details"),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("images/user.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              color: Colors.yellow,
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Name",
                                style: TextStyle(fontSize: 15),
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(model.name,
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              color: Colors.yellow,
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Last Name",
                                style: TextStyle(fontSize: 15),
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(model.lastName,
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              color: Colors.yellow,
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Mobile",
                                style: TextStyle(fontSize: 15),
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(model.mobile,
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              color: Colors.yellow,
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "National Code",
                                style: TextStyle(fontSize: 15),
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(model.nationalCode,
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              color: Colors.yellow,
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "BirthDate",
                                style: TextStyle(fontSize: 15),
                              )),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(model.birthDate,
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
