import 'package:flutter/material.dart';
import 'push_notifications.dart';
import 'faction-main.dart';
import 'faction-data.dart';

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

Widget factionItem(faction, context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(faction['image']),
      colorFilter: new ColorFilter.mode(
          Colors.black.withOpacity(0.4), BlendMode.dstATop),
      fit: BoxFit.cover,
    )),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FactionView(faction: faction)));
        },
        title: Text(faction['name'].toUpperCase(),
            style: TextStyle(fontFamily: 'Handel', color: Colors.white)),
        leading: Image.asset(faction['icon']),
        subtitle: Text(faction['body-text'].substring(0, 100),
            style: TextStyle(color: Colors.white)),
        isThreeLine: true,
      ),
    ),
  );
}

List<Widget> factionOptions(context) {
  List<Widget> output = [];
  for (var i = 0; i < factions.length; i++) {
    output.add(factionItem(factions[i], context));
  }
  return output;
}

class _MyHomePageState extends State<MyHomePage> {
  PushNotificationsManager pnm = new PushNotificationsManager();

  @override
  Widget build(BuildContext context) {
    pnm.init();

    return Scaffold(
        appBar: AppBar(
          title: Text("TWILIGHT IMPERIUM",
              style: TextStyle(
                  color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView(
          children: factionOptions(context),
        ));
  }
}
