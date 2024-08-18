import 'package:bloc/bloc.dart';
import 'package:frontend/presentation/screens/activities.dart';
import 'package:frontend/presentation/screens/explore.dart';
import 'package:frontend/presentation/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/presentation/screens/profile.dart';
import 'package:frontend/presentation/screens/trip_intrest.dart';


part 'nav_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationSuccess(screen: const HomePage()));

  final List<Widget> _screens = [
    const HomePage(),
    const Activities(),
    const Explore(),
    const Profile(),
  ];

  void updateIndex({required int index}) {
    print("Navigating to index: $index"); // Debugging print statement
    emit(NavigationSuccess(index: index, screen: _screens[index]));
  }
}
