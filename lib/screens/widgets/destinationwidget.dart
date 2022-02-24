import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transport/constants/fontconstants.dart';
import 'package:transport/models/destinations.dart';

class DestinationWidget extends StatelessWidget {
  final Destination destination;

  DestinationWidget(this.destination);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 40,
      width: screenwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    destination.stationname!,
                    style: TextStyle(
                        fontFamily: intermedium,
                        color: Colors.black,
                        fontSize: screenwidth * 0.0291),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: Icon(
                        CupertinoIcons.train_style_one,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                    Container(
                      child: Text(
                        destination.train!,
                        style: TextStyle(
                            fontFamily: intermedium,
                            color: Colors.black,
                            fontSize: screenwidth * 0.0211),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Next Stop: " + destination.nextstop!,
                    style: TextStyle(
                        fontFamily: intermedium,
                        color: Colors.black,
                        fontSize: screenwidth * 0.0211),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
