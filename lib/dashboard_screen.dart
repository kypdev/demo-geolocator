import 'package:flutter/material.dart';

import 'check_screen.dart';

class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Widget _buildListLocation({String txtLocation}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(width: 20),
              Text(
                txtLocation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _calTheRome(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('select location'),
                  Text('close'),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: _calTheRome,
                    child: _buildListLocation(
                      txtLocation: 'The Rome',
                    ),
                  ),
                  _buildListLocation(
                    txtLocation: 'Rinma',
                  ),
                  _buildListLocation(
                    txtLocation: 'Vichaivech Hospital',
                  ),
                  _buildListLocation(
                    txtLocation: 'Big C Extra',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
