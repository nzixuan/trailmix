import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/attraction_data.dart';
import '../screens/map_screen.dart';

class AttractionDetailScreen extends StatelessWidget {
  static const routeName = '/attraction_detail';

  Widget build(BuildContext context) {
    final titleID = ModalRoute.of(context).settings.arguments as String;
    final selectedAttraction = attractionData
        .firstWhere((attraction) => attraction.titleID == titleID);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedAttraction.titleID,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(width: 2, color: Colors.black)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Center(
                    child: Image.network(
                  selectedAttraction.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0, 10),
                  spreadRadius: 0.5,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(width: 2, color: Colors.green)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: const Text('About',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedAttraction.description,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                            MapScreen.routeName,
                            arguments: selectedAttraction.location);
                      },
                      child: const Text(
                        'Go to map',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
