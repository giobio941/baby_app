import 'package:Baby/menu.dart';
import 'package:Baby/uatheme.dart';
import 'package:Baby/yomingopage.dart';
import 'package:flutter/material.dart';
import 'package:open_appstore/open_appstore.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMH Baby',
      debugShowCheckedModeBanner: false,
      theme: UATheme.setTheme(),
      home: BabyApp(),
    );
  }
}

class BabyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UATheme.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF8BAE),
        title: Text('SMH Baby'),
      ),
      drawer: Menu(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Center(
            child: Image.asset(
              'images/bbybg.png',
              height: 250.0,
              width: 650.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'After June 1st, SMH BABY will no longer be supported. \nWe encourage you to download our new Maternity Services app:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/yologo.png'),
              ),
            ),
            child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new yomingoPage(
                        url: "https://www.smh.com/smhbaby",
                      ),
                    ),
                  );
                },
                child: null),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "YoMingo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 70.0),
          GestureDetector(
            onTap: () {
              _launchURL('https://smh.com');
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/SMHlogo.png',
                    height: 50.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
