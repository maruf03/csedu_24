import 'package:csedu_24/model/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final User user;

  UserPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.firstName + " " + user.lastName),
            Text(user.email),
            ListView.builder(
              shrinkWrap: true,
              itemCount: user.phone.length,
              itemBuilder: (context, index){
                return Text(user.phone[index], textAlign: TextAlign.center,);
              },
            ),
            Text(user.address),
          ],
        ),
      ),
    );
  }
}