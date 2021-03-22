import 'package:flutter/material.dart';
import 'package:twilight_imperium_companion/strategy-card-list.dart';
import 'faction-menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'strategy-card-list.dart';
import 'rulese-rerference.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // PushNotificationsManager pnm = new PushNotificationsManager();

  @override
  Widget build(BuildContext context) {
    // pnm.init();
    return Scaffold(
      appBar: AppBar(
        title: Text("TWILIGHT IMPERIUM",
            style: TextStyle(
                color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
        backgroundColor: Colors.black54,
      ),
      body: ListView(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StrategyMenuView()));
                },
                title: Text('STRATEGY CARDS',
                    style: TextStyle(fontFamily: 'Handel')),
                subtitle: Text(
                    'A Player reference for the Strategy cards drafted in the Strategy phase during game play.')),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RulesReferenceView()));
                },
                title: Text('RULES REFERENCE',
                    style: TextStyle(fontFamily: 'Handel')),
                subtitle: Text(
                    'A searchable digital version of the living rules reference.')),
          ),
        ),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FactionMenuView()));
              },
              title: Text('FACTIONS', style: TextStyle(fontFamily: 'Handel')),
              subtitle: Text(
                  'A refrence for all of the 24 Factions available in Twilight Imperium and the Prophecy of Kings expansion')),
        )),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('ROUND ORDER', style: TextStyle(fontFamily: 'Handel')),
            subtitle: Text(
                'A Guide for the sequence of steps taking in phases and rounds of gameplay '),
          ),
        )),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              _launchURL("https://www.youtube.com/watch?v=_u2xEap5hBM");
            },
            title: Text('HOW TO PLAY', style: TextStyle(fontFamily: 'Handel')),
            subtitle: Text(
                'Links to a YouTube video explaining the rules of Twilight Imperium 4th Edition'),
          ),
        ))
      ]),
    );
  }
}
