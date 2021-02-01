import 'package:flutter/material.dart';
import 'strategy-card-data.dart';

class StrategyCardView extends StatefulWidget {
  StrategyCardView({Key key, this.strategy}) : super(key: key);
  final Map strategy;
  @override
  _StrategyCardViewState createState() => _StrategyCardViewState();
}

class _StrategyCardViewState extends State<StrategyCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("STRATEGY CARDS",
              style: TextStyle(
                  color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
          backgroundColor: Colors.black54,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  color: Color.fromRGBO(
                      widget.strategy['color'][0],
                      widget.strategy['color'][1],
                      widget.strategy['color'][2],
                      1),
                  width: 3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      widget.strategy['initiative'].toString() +
                          " | " +
                          widget.strategy['name'],
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Handel',
                          color: Colors.white)),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Primary Ability",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Handel',
                          color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.strategy['primary'],
                      style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(color: Colors.white),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Secondary Ability",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Handel',
                          color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.strategy['secondary'],
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ));
  }
}
