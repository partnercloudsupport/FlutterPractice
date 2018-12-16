import 'package:flutter/material.dart';

import '../ui/button_dark.dart';

class PokemonCreatePage extends StatefulWidget {
  final Function addProduct;

  PokemonCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _PokemonCreatePageState();
  }
}

class _PokemonCreatePageState extends State<PokemonCreatePage> {
  String _name = '';
  String _description = '';
  String _type = '';
  double _startingHealth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitPokemon() {
    _formKey.currentState.save();

    final Map<String, dynamic> pokmeon = {
      'name': _name,
      'description': _description,
      'type': _type,
      'startingHealth': _startingHealth,
      'image': 'assets/pikachu.png'
    };

    Navigator.pushReplacementNamed(context, '/pokemon');
    widget.addProduct(pokmeon);
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      onSaved: (String value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Description'),
      onSaved: (String value) {
        setState(() {
          _description = value;
        });
      },
    );
  }

  Widget _buildTypeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Type'),
      onSaved: (String value) {
        setState(() {
          _type = value;
        });
      },
    );
  }

  Widget _buildHealthField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Starting Health'),
      onSaved: (String value) {
        setState(() {
          _startingHealth = double.parse(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _buildNameField(),
            _buildDescriptionField(),
            _buildTypeField(),
            _buildHealthField(),
            SizedBox(height: 16),
            DarkButton('SAVE', _submitPokemon),
          ],
        ),
      ),
    );
  }
}
