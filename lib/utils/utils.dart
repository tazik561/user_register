
  import 'package:flutter/material.dart';

void showSnackbar(String msg, BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        elevation: 6.0,
        behavior: SnackBarBehavior.floating,
        content: RichText(
            text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(
                  Icons.error,
                  color: Colors.purple,
                ),
              ),
            ),
            TextSpan(
              text: '$msg   ',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 18,
              ),
            ),
          ],
        )),
      ),
    );
  }