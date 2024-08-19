import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/icons.dart';
import 'package:frontend/core/images.dart';
import 'package:standard_searchbar/new/standard_icons.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.sizeOf(context).height;

    const String name = "Julia";
    const String userImg = AppImages.user;

    return SafeArea(
      child: Scaffold(
          body: Container(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello $name!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.kDarkColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            "Let's explore the best Destinations!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.kDarkColor,
                              fontWeight: FontWeight.w200,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 25, // Adjust the size as needed
                        backgroundImage: AssetImage(userImg), // Update path
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: width * 0.9,
                        child: const StandardSearchAnchor(
                          searchBar: StandardSearchBar(
                            bgColor: AppColors.kGrey,
                            height: 40,
                            trailing: StandardIcons(
                              icons: [
                                Icon(
                                  MyIcons.search,
                                  color: AppColors.kFourthColor,
                                  size: 20,
                                )
                              ],
                            ),
                            leading: StandardIcons(icons: [SizedBox.shrink()]),
                            borderRadius: 10,
                          ),
                          suggestions: StandardSuggestions(
                            suggestions: [
                              // StandardSuggestion(text: 'Suggestion 1'),
                              // StandardSuggestion(text: 'Suggestion 2'),
                              // StandardSuggestion(text: 'Suggestion 3'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Row(),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: -5,
              child: SvgPicture.asset(
                AppImages.plane,
                width: 120,
                height: 120,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: InkWell(
                    //highlightColor: AppColors.kTertiaryColor,

                    splashColor: AppColors.kSecondaryColor,
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Navigator.pushNamed(context, '/chatbot');
                    },
                    child: SvgPicture.asset(
                      AppImages.chatbot,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
