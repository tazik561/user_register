import 'package:flutter/material.dart';

import 'pages/add_users_page.dart';
import 'pages/home_page.dart';
import 'pages/not_found_page.dart';
import 'pages/register_user_page.dart';
import 'pages/user_details_page.dart';
import 'pages/user_list_page.dart';
import 'route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterUserPage());

      case addUsersRoute:
        return MaterialPageRoute(builder: (_) => AddUsersPage());

      case userListRoute:
        return MaterialPageRoute(builder: (_) => UserListPage());

      case userDetailsRoute:
        return MaterialPageRoute(builder: (_) => UserDetailsPage());
    }

    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
