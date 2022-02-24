import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/models/destinations.dart';

class SearchController extends GetxController{
  TextEditingController currentstopcontroller=TextEditingController();
  TextEditingController finalstopcontroller=TextEditingController();
  List<Destination> prevdestlist=[
    Destination(1, "Bremen farge", "RS1", "Bremen Schonebeck"),
    Destination(1, "Bremen Finkenschlag", "RE8", "Bremen Schonebeck"),
    Destination(1, "Bremen Seefahrstraasse", "RS2", "Bremen Schonebeck"),
    Destination(1, "Bremen Hbf", "RB4", "Bremen Schonebeck"),
    Destination(1, "Hamburg Hbf", "RS1", "Bremen Schonebeck"),
    Destination(1, "Hannover Hbf", "RS1", "Bremen Schonebeck"),
    Destination(1, "Bremen Grohn", "RE8", "Bremen Schonebeck"),
    Destination(1, "Bremen Gropelingen", "RS2", "Bremen Schonebeck"),
  ];
}