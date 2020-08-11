import 'package:Baby/main.dart';
import 'package:Baby/privacypolicy.dart';
import 'package:Baby/socialmedia.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navigation.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        cacheExtent: 10,
        addAutomaticKeepAlives: true,
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text(
                "smh",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            color: Color(0xffFF8BAE),
          ),
          ListTile(
            onTap: () {
              Navigation.close(context);
              Navigation.closeOpen(context, BabyApp());
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFF8BAE),
            ),
            title: Text('Back to Home'),
          ),
          line(),
          ListTile(
            onTap: () async {
              _launchURL.call('tel://9419179000');
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFF8BAE),
            ),
            title: Text("Call SMH"),
          ),
          line(),
          ListTile(
            onTap: () {
              Navigation.closeOpen(context, SocialMedia());
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFF8BAE),
            ),
            title: Text("Social Media"),
          ),
          line(),
          ListTile(
            onTap: () {
              StoreRedirect.redirect(
                  androidAppId: "com.easeapplications.receiver&hl=en_US",
                  iOSAppId: "838601897");
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFF8BAE),
            ),
            title: Text("EASE Messaging App"),
          ),
          line(),
          ListTile(
            onTap: () {
              StoreRedirect.redirect(
                  androidAppId: "com.logicjunction.smh.wayfinder&hl=en_US",
                  iOSAppId: "1234682654");
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFF8BAE),
            ),
            title: Text("SMH Wayfinder"),
          ),
          line(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new PrivacyPolicy(
                    url: "https://www.smh.com/privacy",
                  ),
                ),
              );
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFF8BAE),
            ),
            title: Text('Privacy Statement'),
          ),
          line(),
          SizedBox(
            height: 280,
          ),
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
                    height: 70.0,
                    width: 150.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  line() {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
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
