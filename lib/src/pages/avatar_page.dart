import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('SL'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/jar-loading.gif',
            image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stan-lee-wandavision-cameo-tributo-homenaje-1614077568.jpg',
          fadeInDuration: Duration( milliseconds: 200),
        ),
      ),
    );
  }
}
