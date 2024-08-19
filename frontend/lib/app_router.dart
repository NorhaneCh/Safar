import "package:flutter/material.dart";
import 'package:frontend/presentation/layout.dart';
import 'package:frontend/presentation/screens/act_interest.dart';
import 'package:frontend/presentation/screens/activities.dart';
import 'package:frontend/presentation/screens/chatbot.dart';
import 'package:frontend/presentation/screens/destInterest.dart';
import 'package:frontend/presentation/screens/explore.dart';
import 'package:frontend/presentation/screens/home.dart';
import 'package:frontend/presentation/screens/profile.dart';
import 'package:frontend/presentation/screens/trip_intrest.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TripIntrest());
      case '/actInt':
        return MaterialPageRoute(builder: (_) => const ActInterest());
      case '/destInterest':
        return MaterialPageRoute(builder: (_) => const Destinterest());
      case '/layout':
        return MaterialPageRoute(builder: (_) => const AppLayout());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/chatbot':
        return MaterialPageRoute(builder: (_) => const ChatPage());
      case '/activities':
        return MaterialPageRoute(builder: (_) => const Activities());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case '/explore':
        return MaterialPageRoute(builder: (_) => const Explore());
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
