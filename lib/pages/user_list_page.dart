import 'package:flutter/material.dart';
import 'package:user_register_app/model/users_model.dart';
import 'package:user_register_app/pages/user_details_page.dart';
import 'package:user_register_app/utils/databse_provider.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  var whereCluse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        whereCluse = value;
                      });
                    },
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tap to search",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: UserListWidget(
        where:whereCluse,
      ),
    );
  }
}

class UserListWidget extends StatefulWidget {
  String where;
  UserListWidget({@required this.where});

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  Future _usersFuture;

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  void didUpdateWidget(UserListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getUsers();
  }

  void _getUsers() {
    _usersFuture = DatabaseProvider.db.getUserList(widget.where);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<UsersModle>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && !snapshot.hasError) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return UserWidget(
                      user: snapshot.data[index],
                    );
                  }),
            );
          } else {
            return Center(
              child: Text("Something is wrong !!!"),
            );
          }
        },
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final UsersModle user;

  UserWidget({this.user});
  var textStyle = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          leading: Image.asset("images/user.png"),
          title: Row(
            children: <Widget>[
              Text(
                user.name,
                style: textStyle,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                user.lastName,
                style: textStyle,
              )
            ],
          ),
          subtitle: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => UserDetailsPage(
                        model: user,
                      )));
            },
            child: Text(
              user.nationalCode,
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
