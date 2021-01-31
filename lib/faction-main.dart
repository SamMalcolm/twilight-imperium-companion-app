import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget factionPage(name, icon, image, text) {
  return Stack(children: [
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(image),
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
            child: Image.asset(icon),
          ),
          Text(
            name.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontFamily: 'Handel', fontSize: 32),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(text,
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    )
  ]);
}
