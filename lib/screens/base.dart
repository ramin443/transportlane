import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transport/constants/fontconstants.dart';
import 'package:transport/getxcontroller/basecontroller.dart';
import 'package:transport/screens/search.dart';
import 'package:transport/screens/widgets/destinationwidget.dart';

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<BaseController>(
        init: BaseController(),
        builder: (basecontroller) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              width: screenwidth,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: screenwidth * 0.8,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: TextField(
                      controller: basecontroller.searchcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(),
                          hintText: "Search destinations"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()));
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        size: 24,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                    icon: Icon(
                      CupertinoIcons.search,
                      size: 22,
                      color: Colors.white,
                    )),
              ],
              centerTitle: false,
              backgroundColor: Colors.redAccent,
              elevation: 0,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: Icon(
                        CupertinoIcons.train_style_one,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Text(
                      "Transport Lane",
                      style: TextStyle(
                          fontFamily: intermedium,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: screenwidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenwidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your previous destinations",
                          style: TextStyle(
                              fontFamily: intermedium,
                              color: Colors.black,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: basecontroller.prevdestlist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DestinationWidget(
                                basecontroller.prevdestlist[index]),
                            Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Divider(
                                  height: 1,
                                ))
                          ],
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
