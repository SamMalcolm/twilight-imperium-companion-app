import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FactionView extends StatefulWidget {
  FactionView({Key key, this.faction}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Map faction;

  @override
  _FactionViewState createState() => _FactionViewState();
}

class _FactionViewState extends State<FactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: factionPage(widget.faction, context));
  }

  Widget factionPage(faction, context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(faction['image']),
          fit: BoxFit.cover,
        )),
      ),
      Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withAlpha(0),
            Colors.black26,
            Colors.black87
          ],
        ),
      )),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(faction['icon']),
            ),
            Text(
              faction['name'].toUpperCase(),
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Handel', fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(faction['body-text'],
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'Sans-Serif')),
            ),
            MaterialButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      )
    ]);
  }
}
