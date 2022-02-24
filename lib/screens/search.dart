import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transport/constants/fontconstants.dart';
import 'package:transport/getxcontroller/searchcontroller.dart';
import 'package:transport/screens/widgets/destinationwidget.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (searchcontroller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 22,
                    color: Colors.white,
                  )),
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
              bottom: PreferredSize(
                preferredSize: Size(screenwidth, 100),
                child: Container(
                  width: screenwidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        width: screenwidth * 0.8,
                                        height: 36,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24))),
                                        child: TextField(
                                          controller: searchcontroller
                                              .currentstopcontroller,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(),
                                              hintText:
                                                  "Your current destination"),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.location,
                                            size: 24,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24))),
                                  child: TextField(
                                    controller:
                                        searchcontroller.finalstopcontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(),
                                        hintText: "Your final destination"),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.location,
                                      size: 24,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: searchcontroller.prevdestlist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DestinationWidget(
                                searchcontroller.prevdestlist[index]),
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
