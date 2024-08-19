import 'package:flutter/material.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/icons.dart';
import 'package:frontend/core/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/presentation/layout.dart';

List<bool> selections = List.generate(6, (index) => false);

class Destinterest extends StatefulWidget {
  const Destinterest({super.key});

  @override
  State<Destinterest> createState() => _DestinterestState();
}

class _DestinterestState extends State<Destinterest>
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
        'text': 'Hiking & Outdoor Adventures',
        'icon': IntrestIcons.compass_1,
        'color': AppColors.kPrimaryColor,
      },
      {
        'text': 'Museums & Art Galleries',
        'icon': IntrestIcons.art,
        'color': AppColors.kSecondaryColor,
      },
      {
        'text': 'Shopping & Markets',
        'icon': IntrestIcons.shop,
        'color': AppColors.kSecondaryColor,
      },
      {
        'text': 'Culinary Tours & Dining Out',
        'icon': IntrestIcons.food,
        'color': AppColors.kPrimaryColor,
      },
      {
        'text': 'Relaxation & Spa Treatments',
        'icon': IntrestIcons.relax,
        'color': AppColors.kPrimaryColor,
      },
      {
        'text': 'Beach Activities',
        'icon': IntrestIcons.umbrella_beach,
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
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                  AppImages.ellipse, // Your ellipse asset path
                  width: 130,
                  height: 130,
                ),
              ),
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
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'What activities do you like to do during your trips?',
                            textAlign: TextAlign.center,
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
                        color: AppColors.kWhiteColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AppLayout();
                      }));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                      child: Text(
                        'Let\'s Go!',
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
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
