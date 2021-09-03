import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 20.0,),
          _cardTipo2()
        ],
      ),
    );
  }



  Widget _cardTipo1() {
    return Card(
      elevation: 5.0,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.ac_unit, color: Colors.blue,),
            title: Text('Este es el titulo de la tarjeta'),
            subtitle: Text('Casdsadjijdisadjsaidja disdidja doaidjasd ojasdjsaidj fldsfjlkjfslfj lkfj'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _cardTipo2(){
  return Card(
    elevation: 5.0,
    clipBehavior: Clip.antiAlias,
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      children: [
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://media-exp1.licdn.com/dms/image/C561BAQGEbvT3SFyR9Q/company-background_10000/0/1582050035728?e=2159024400&v=beta&t=xwPLRsVBBNXQQS3HN3q7hsYXmt6JxJsH6lpnbh9Y1ko'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Lo que sea'),
        )
      ],
    ),
  );
}