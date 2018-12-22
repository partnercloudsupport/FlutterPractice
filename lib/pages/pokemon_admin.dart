import 'package:flutter/material.dart';

import './pokemon_create.dart';
import './pokemon_owned.dart';

class PokemonAdminPage extends StatelessWidget {
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Julian Currie"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('All Pokemon'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pokemon_feed');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Pokemon'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: "Create Pokemon",
              ),
              Tab(
                icon: Icon(Icons.list),
                text: "My Pokemon",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PokemonCreatePage(),
            PokemonOwnedPage(),
          ],
        ),
      ),
    );
  }
}
