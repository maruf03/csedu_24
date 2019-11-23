import 'package:csedu_24/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:csedu_24/model/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> jsonData;

  _getData() async {
    jsonData =
        DefaultAssetBundle.of(context).loadString("assets/data/localdb.json");
  }

  Widget _showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView(UserList list) {
    return ListView.builder(
      itemCount: list.users.length,
      itemBuilder: (context, index) {
        return FlatButton(
          child: Card(
            child: Row(
              children: <Widget>[Text(list.users[index].firstName)],
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return UserPage(user: list.users[index],);
              },
            ));
          },
        );
      },
    );
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSEDU 24 Contact List"),
      ),
      body: Center(
        child: FutureBuilder(
          future: jsonData,
          builder: (context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return _showLoading();
              case ConnectionState.done:
                return _buildListView(UserList.fromJson(snapshot.data));
            }
          },
        ),
      ),
    );
  }
}
