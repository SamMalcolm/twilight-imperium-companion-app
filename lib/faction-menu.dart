import 'package:flutter/material.dart';
import 'faction-main.dart';
import 'faction-data.dart';

class FactionMenuView extends StatefulWidget {
  FactionMenuView({Key key}) : super(key: key);

  @override
  _FactionMenuState createState() => _FactionMenuState();
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

class _FactionMenuState extends State<FactionMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FACTIONS",
              style: TextStyle(
                  color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
          backgroundColor: Colors.black54,
        ),
        body: ListView(
          children: factionOptions(context),
        ));
  }
}
