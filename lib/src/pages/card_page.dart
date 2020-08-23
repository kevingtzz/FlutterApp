import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards')
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardtipo1(),
          SizedBox(height: 30.0),
          _cardtipo2(),
          SizedBox(height: 30.0),
          _cardtipo1(),
          SizedBox(height: 30.0),
          _cardtipo2(),
          SizedBox(height: 30.0),
          _cardtipo1(),
          SizedBox(height: 30.0),
          _cardtipo2(),
          SizedBox(height: 30.0),
          _cardtipo1(),
          SizedBox(height: 30.0),
          _cardtipo2(),
        ]
      ),
    );
  }
          
  Widget _cardtipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("I'm the card title"),
            subtitle: Text("I'm the card description, this is the test description"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Text("Cancel")
              ),
              FlatButton(
                onPressed: null,
                child: Text("OK")
              )
            ],
          )
        ]
      ),
    );
  }

  Widget _cardtipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            fadeInDuration: Duration(milliseconds:200),
            height: 300.0,
            fit: BoxFit.cover,
            image: NetworkImage('https://courseupload.com/wp-content/uploads/2019/10/3123v13-3.jpg'),
          ),
          //Image(
          //  image: NetworkImage('https://courseupload.com/wp-content/uploads/2019/10/3123v13-3.jpg'),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Whatever')
          )
        ]
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }

}
