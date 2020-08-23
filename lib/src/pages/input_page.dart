import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPage createState() => _InputPage();
}

class _InputPage extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _date = '';
  String _selectedOption = 'fly';

  List<String> _powers = ['fly', 'x-ray', 'super breath', 'super strong']; 

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs text')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPass(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown(),
          Divider(),
          _createPerson(),
        ]
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letters: ${_name.length}'),
        hintText: 'Person name',
        labelText: 'Name',
        helperText: 'Only name',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (current) {
        setState(() {
          _name = current;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('The name is: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
      return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (current) => setState(() {
          _email = current;
      })
    );
  }

  _createPass() {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (current) => setState(() {
          _email = current;
      })
    ); 
  }

  Widget _createDate(BuildContext context) {
      return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDate,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Birth date',
        labelText: 'Date',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      }
    ); 
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDate.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDopdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _powers.forEach((power) {
      lista.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return lista;
  }

  Widget _createDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
                  value: _selectedOption,
                  items: getOptionsDopdown(), 
                  onChanged: (opt) {
                    setState(() {
                    _selectedOption = opt;
                  });
                }
          )
        ),
      ],
    );
  }
}