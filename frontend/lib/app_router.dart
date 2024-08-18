import "package:flutter/material.dart";
import 'package:frontend/presentation/layout.dart';
import 'package:frontend/presentation/screens/activities.dart';
import 'package:frontend/presentation/screens/explore.dart';
import 'package:frontend/presentation/screens/home.dart';
import 'package:frontend/presentation/screens/profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/layout':
        return MaterialPageRoute(builder: (_) => AppLayout());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/activities':
        return MaterialPageRoute(builder: (_) => Activities());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/explore':
        return MaterialPageRoute(builder: (_) => Explore());
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
