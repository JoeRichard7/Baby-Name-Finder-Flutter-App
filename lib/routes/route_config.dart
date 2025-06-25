import 'package:baby_name_app/routes/route_names.dart';
import 'package:baby_name_app/screens/favourite_screen.dart';
import 'package:baby_name_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/select_baby_screen.dart';
import '../screens/select_religion_screen.dart';


class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.selectBaby:
        return MaterialPageRoute(builder: (context) => BabySelect());
      case RouteNames.selectReligion:
        return MaterialPageRoute(builder: (context) => SelectReligionScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.favouriteScreen:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
    }
    return null;
  }
}
