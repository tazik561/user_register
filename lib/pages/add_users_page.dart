import 'package:flutter/material.dart';

import '../model/users_model.dart';
import '../route_names.dart';
import '../utils/databse_provider.dart';
import '../utils/utils.dart';

class AddUsersPage extends StatefulWidget {
  @override
  _AddUsersPageState createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nationalCodeController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                            "Register",
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
                              if (value.isEmpty) return "Please fill";
                              return null;
                            },
                            controller: _nameController,
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
                              labelText: "Name",
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
                              if (value.isEmpty) return "Please fill";
                              return null;
                            },
                            controller: _lastNameController,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.portrait,
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
                              labelText: "Last Name",
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
                              if (value.isEmpty) return "Please fill";
                              return null;
                            },
                            controller: _mobileController,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.mobile_screen_share,
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
                              labelText: "Mobile",
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
                              if (value.isEmpty) return "Please fill";
                              return null;
                            },
                            controller: _nationalCodeController,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.confirmation_number,
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
                              labelText: "National code",
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
                              if (value.isEmpty) return "Please fill";
                              return null;
                            },
                            controller: _birthDateController,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.date_range,
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
                              labelText: "BirthDate",
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
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              _saveInfo(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  void _saveInfo(BuildContext ctx) async {
    await DatabaseProvider.db.saveUser(UsersModle(
        lastName: _lastNameController.text,
        name: _nameController.text,
        mobile: _mobileController.text,
        birthDate: _birthDateController.text,
        nationalCode: _nationalCodeController.text));
    _lastNameController.text = "";
    _nameController.text = "";
    _mobileController.text = "";
    _birthDateController.text = "";
    _nationalCodeController.text = "";

    showSnackbar("Saved Successfull", ctx);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Users"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: _mainForm(context),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.supervised_user_circle,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(userListRoute);
        },
      ),
    );
  }
}
