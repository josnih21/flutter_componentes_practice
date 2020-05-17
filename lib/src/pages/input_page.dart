import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _date = "";
  String _selectedOption = 'Fly';

  List _powers = ['Fly', 'X Rays', 'Super Stregth', 'Super tonto'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input fields page')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDatePicker(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Characters ${_name.length}'),
        hintText: 'Nombre completo',
        labelText: 'Name',
        helperText: 'Ponga el nombre exclusivamente',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((poder) {
      list.add(DropdownMenuItem(child: Text(poder), value: poder));
    });

    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
              value: _selectedOption,
              items: getOptions(),
              onChanged: (opt) {
                setState(() {
                  _selectedOption = opt;
                });
              }),
        ),
      ],
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_outline),
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  Widget _createDatePicker(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Birth Date',
        labelText: 'Birth Date',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.assignment_ind),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.day.toString() +
            '/' +
            picked.month.toString() +
            '/' +
            picked.year.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('El nombre es: $_name'),
      subtitle: Text('El email es: $_email'),
      trailing: Text('$_selectedOption'),
    );
  }
}
