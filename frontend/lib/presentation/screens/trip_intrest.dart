import 'package:flutter/material.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/icons.dart';
import 'package:frontend/core/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/presentation/screens/act_interest.dart';

List<bool> selections = List.generate(6, (index) => false);

class TripIntrest extends StatefulWidget {
  const TripIntrest({super.key});

  @override
  State<TripIntrest> createState() => _TripIntrestState();
}

class _TripIntrestState extends State<TripIntrest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.sizeOf(context).height;

    // List of data for each card
    final List<Map<String, dynamic>> cardData = [
      {
        'text': 'Adventure & Exploration',
        'icon': IntrestIcons.compass_1,
        'color': AppColors.kPrimaryColor,
      },
      {
        'text': 'Relaxation',
        'icon': IntrestIcons.relax,
        'color': AppColors.kSecondaryColor,
      },
      {
        'text': 'Cultural Tours',
        'icon': IntrestIcons.theater_masks,
        'color': AppColors.kSecondaryColor,
      },
      {
        'text': 'Food Experiences',
        'icon': IntrestIcons.food,
        'color': AppColors.kPrimaryColor,
      },
      {
        'text': 'Family-Friendly Vacations',
        'icon': IntrestIcons.family,
        'color': AppColors.kPrimaryColor,
      },
      {
        'text': 'Luxury & Leisure',
        'icon': IntrestIcons.diamond,
        'color': AppColors.kSecondaryColor,
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  AppImages.skyCloud, // Replace with your sky SVG asset path
                  width: 100,
                  height: 100,
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: SvgPicture.asset(
              //     AppImages.ellipse, // Your ellipse asset path
              //     width: 100,
              //     height: 100,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 80.0),
                child: Center(
                  child: Column(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Let\'s get to know your travel style! ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'What kind of trips do you enjoy?',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cardData.length ~/ 2, // 2 cards per row
                          itemBuilder: (context, rowIndex) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 2; i++)
                                  if (rowIndex * 2 + i < cardData.length)
                                    buildCard(
                                      context,
                                      width,
                                      cardData[rowIndex * 2 + i],
                                      rowIndex * 2 + i,
                                      selections,
                                    ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned assets
              Positioned(
                top: 10,
                left: -10,
                child: SvgPicture.asset(
                  AppImages.plane, // Replace with your plane SVG asset path
                  width: 120,
                  height: 120,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 5,
                child: SvgPicture.asset(
                  AppImages.tourist, // Replace with your plane SVG asset path
                  width: 150,
                  height: 150,
                ),
              ),

              Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 15.0, bottom: 15.0, top: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.kTertiaryColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ActInterest();
                      }));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: AppColors.kTertiaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, double width,
      Map<String, dynamic> data, int index, List<bool> selections) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        width: width * 0.3,
        height: width * 0.37,
        decoration: BoxDecoration(
          border: (selections[index])
              ? Border.all(color: AppColors.kTertiaryColor, width: 2)
              : Border.all(color: Colors.transparent),
          color: const Color(0xFFD6D6D6).withOpacity(0.4),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: data['color'],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(data['icon']),
              ),
              Text(
                data['text'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selections[index] = !selections[index];
        });
      },
    );
  }
}
