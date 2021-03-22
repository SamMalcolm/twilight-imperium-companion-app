import 'package:flutter/material.dart';

class RulesView extends StatefulWidget {
  RulesView({Key key, this.rule}) : super(key: key);

  final Map rule;

  @override
  _RulesViewState createState() => _RulesViewState();
}

Widget ruleTitle(String name) {
  return Text(name);
}

Widget ruleSubTitle(String name) {
  return Text(name);
}

List<dynamic> rulesSubText(List ruleSubTexts) {
  List output = [];
  for (var i = 0; i < ruleSubTexts.length; i++) {
    output.add(ruleSubTitle(ruleSubTexts[i]));
    output.add(SizedBox(height: 10.0));
  }
  return output;
}

class _RulesViewState extends State<RulesView> {
  @override
  Widget build(BuildContext context) {
    // pnm.init();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.rule['title'].toUpperCase(),
              style: TextStyle(
                  color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
          backgroundColor: Colors.black54,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ruleTitle(widget.rule['title']),
                  ...rulesSubText(widget.rule['sub_text'])
                ],
              ),
            )));
  }
}
