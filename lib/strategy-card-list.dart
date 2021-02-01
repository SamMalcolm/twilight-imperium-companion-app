import 'package:flutter/material.dart';
import 'strategy-card-data.dart';
import 'strategy-card-view.dart';

class StrategyMenuView extends StatefulWidget {
  StrategyMenuView({Key key}) : super(key: key);

  @override
  _StrategyMenuViewState createState() => _StrategyMenuViewState();
}

Widget strategyItem(strategy, context) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
      border: Border.all(
          color: Color.fromRGBO(strategy['color'][0], strategy['color'][1],
              strategy['color'][2], 1),
          width: 3),
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        StrategyCardView(strategy: strategy)));
          },
          title: Text(strategy['name'].toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Handel', color: Colors.white, fontSize: 20)),
          leading: Text(strategy['initiative'].toString(),
              style: TextStyle(
                  fontFamily: 'Handel', color: Colors.white, fontSize: 20))),
    ),
  );
}

List<Widget> strategyOptions(context) {
  List<Widget> output = [];
  for (var i = 0; i < strategyCards.length; i++) {
    output.add(strategyItem(strategyCards[i], context));
  }
  return output;
}

class _StrategyMenuViewState extends State<StrategyMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("STRATEGY CARDS",
              style: TextStyle(
                  color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
          backgroundColor: Colors.black54,
        ),
        body: ListView(
          children: strategyOptions(context),
        ));
  }
}
