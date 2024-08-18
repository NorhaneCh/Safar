
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/logic/nav/nav_cubit.dart';
import 'package:frontend/presentation/screens/home.dart';
import 'package:frontend/presentation/widgets/custom_nav_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        child: BlocConsumer<NavigationCubit, NavigationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body:
                  state is NavigationSuccess ? state.screen : const HomePage(),
              bottomNavigationBar: state is NavigationSuccess
                  ? CustomBottomNavigationBar(state: state)
                  : Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.kPrimaryColor,
                        size: 30,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
