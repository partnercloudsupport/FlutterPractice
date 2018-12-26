import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pokemon_create.dart';
import '../scoped-models/main.dart';

class PokemonOwnedPage extends StatefulWidget {
  final MainModel model;

  PokemonOwnedPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _PokemonOwnedPageState();
  }
}

class _PokemonOwnedPageState extends State<PokemonOwnedPage> {
  @override
  initState() {
    widget.model.fetchPokemon();
    super.initState();
  }

  Widget _buildEditButton(BuildContext context, MainModel model, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectPokemon(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return PokemonCreatePage();
            },
          ),
        );
      },
    );
  }

  Widget _buildPokemonListItem(BuildContext context, MainModel model, int index) {
    return Dismissible(
      key: Key(model.allpokemon[index].name),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        model.selectPokemon(index);
        model.deletePokemon();
      },
      background: Container(color: Colors.red),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(model.allpokemon[index].image),
            ),
            title: Text(model.allpokemon[index].name),
            subtitle: Text('Health: ${model.allpokemon[index].startingHealth.toString()}'),
            trailing: _buildEditButton(context, model, index),
          ),
          Divider()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _buildPokemonListItem(context, model, index);
          },
          itemCount: model.allpokemon.length,
        );
      },
    );
  }
}
