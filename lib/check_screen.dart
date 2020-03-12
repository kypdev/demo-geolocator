import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0.00", "en_US");

class CheckScreen extends StatefulWidget {
  @override
  _CheckScreenState createState() => _CheckScreenState();
}

_onAlertButtonPressed(context) {}

class _CheckScreenState extends State<CheckScreen> {
  void _calDistance() async {
    double distanceInMeters = await Geolocator()
        .distanceBetween(13.7073418, 100.3539335, 13.7072332, 100.3570683);

    print(distanceInMeters);
    Alert(
      context: context,
      type: AlertType.success,
      title: "Distance",
      desc: '${oCcy.format(distanceInMeters)} Meters',
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cal Distance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _calDistance,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.arrow_downward,
                            size: 90,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Icon(
                          Icons.arrow_downward,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text('SAU'),
                  Text('13.7073418 / 100.3539335'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
