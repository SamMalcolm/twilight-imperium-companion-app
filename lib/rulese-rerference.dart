import 'package:flutter/material.dart';
import 'rules-reference-data.dart';
import 'rule-view.dart';

class RulesReferenceView extends StatefulWidget {
  RulesReferenceView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RulesReferenceViewState createState() => _RulesReferenceViewState();
}

Widget ruleCard(name, context, subtitle, number, rule) {
  return Card(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RulesView(rule: rule)));
        },
        title:
            Text(number + " " + name, style: TextStyle(fontFamily: 'Handel')),
        subtitle: Text(subtitle)),
  ));
}

List<Widget> rulesOptions(rulesData, context) {
  List<Widget> output = [];
  for (var i = 0; i < rulesData.length; i++) {
    output.add(ruleCard(rulesData[i]["title"], context,
        rulesData[i]['sub_text'][0], rulesData[i]['number'], rulesData[i]));
  }
  return output;
}

class _RulesReferenceViewState extends State<RulesReferenceView> {
  // PushNotificationsManager pnm = new PushNotificationsManager();
  List<Map> rulesData = rules;
  List<Map> filteredRulesData = rules;

  @override
  void initState() {
    super.initState();
    setState(() {
      rulesData = rules;
      filteredRulesData = rules;
    });
  }

  @override
  Widget build(BuildContext context) {
    // pnm.init();
    return Scaffold(
        appBar: AppBar(
          title: Text("RULES REFERENCE",
              style: TextStyle(
                  color: Colors.orange, fontFamily: 'Ambroise', fontSize: 24)),
          backgroundColor: Colors.black54,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (String value) {
                setState(() {
                  RegExp re =
                      new RegExp(value, caseSensitive: false, multiLine: true);

                  if (value == "") {
                    filteredRulesData = rulesData;
                  } else {
                    filteredRulesData = rulesData.where((r) {
                      bool match = false;
                      if (re.hasMatch(r['title'])) {
                        match = true;
                      }
                      for (var i = 0; i < r['sub_text'].length; i++) {
                        if (re.hasMatch(r['sub_text'][i])) {
                          match = true;
                        }
                      }
                      return match;
                    }).toList();
                  }
                });
              },
              decoration:
                  InputDecoration(filled: true, labelText: 'Search Rules'),
            ),
          ),
          Expanded(
            child: ListView(children: rulesOptions(filteredRulesData, context)),
          )
        ]));
  }
}
