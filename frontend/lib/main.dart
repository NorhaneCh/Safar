import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app_router.dart';
import 'package:frontend/core/themes.dart';
import 'package:frontend/logic/nav/nav_cubit.dart';
import 'package:frontend/presentation/layout.dart';
import 'package:frontend/presentation/screens/trip_intrest.dart';

void main() {
  AppRouter appRouter = AppRouter();
  runApp(
    MyApp(appRouter: appRouter),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Safar",
        theme: Themes.kLightTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
        home: const TripIntrest(),
      ),
    );
  }
}
