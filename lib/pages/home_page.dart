import 'package:flutter/material.dart';

import '../route_names.dart';
import '../utils/databse_provider.dart';
import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _login(BuildContext ctx) async {
    var count = await DatabaseProvider.db.getUser(
      username: _userNameController.text.trim(),
      password: _passController.text.trim(),
    );
    if (count != null && count > 0)
      Navigator.of(context).pushNamed(addUsersRoute);
    else
      showSnackbar("Wrong UserName or Password", ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome "),
      ),
      body: Form(
        key: _key,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("images/user.png"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: ([
                      BoxShadow(color: Colors.black, blurRadius: 5.0)
                    ]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            "Welcome",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 5.0),
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return ("Please enter user name");
                              }
                              return null;
                            },
                            controller: _userNameController,
                            maxLines: 1,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.assignment_ind,
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: "User Name",
                              contentPadding: EdgeInsets.only(
                                  left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 5.0),
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return ("Please enter password");
                              }
                              return null;
                            },
                            controller: _passController,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.visibility_off,
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: "Password",
                              contentPadding: EdgeInsets.only(
                                  left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_key.currentState.validate()) _login(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(registerRoute),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
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
