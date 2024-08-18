import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/icons.dart';
import 'package:frontend/logic/nav/nav_cubit.dart';
import 'package:frontend/presentation/widgets/custom_nav_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final NavigationSuccess state;

  const CustomBottomNavigationBar({
    super.key,
    required this.state,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _animationController,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.kFourthColor.withOpacity(0.3),
            offset: Offset(0, -0.75),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomBottomNavBarItem(
            state: widget.state,
            index: 0,
            icon: MyIcons.home,
            label: "Home",
          ),
          CustomBottomNavBarItem(
            state: widget.state,
            index: 1,
            icon: MyIcons.smiley,
            label: "Activities",
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: CustomBottomNavBarItemPainter(
                      opacity: _animation.value * 0.4,
                      radiusController: _animation.value * 0.7,
                    ),
                    child: Material(
                      color: AppColors.kSecondaryColor,
                      shape: const CircleBorder(),
                      animationDuration: const Duration(milliseconds: 900),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        customBorder: const CircleBorder(
                          side: BorderSide(
                            color: AppColors.kWhiteColor,
                            width: 2,
                          ),
                        ),
                        splashColor: AppColors.kSecondaryColor.withOpacity(0.2),
                        onTap: () {
                          Navigator.pushNamed(context, '/layout');
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            MyIcons.add,
                            color: AppColors.kWhiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          CustomBottomNavBarItem(
            state: widget.state,
            index: 2,
            icon: MyIcons.trips,
            label: "Trips",
          ),
          CustomBottomNavBarItem(
            state: widget.state,
            index: 3,
            icon: MyIcons.user,
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
