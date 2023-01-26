import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movies_app/components/custom_outline.dart';
import 'package:movies_app/components/masked_image.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/widgets/blur_container.dart';
import 'package:movies_app/widgets/glassmorphism_btmNavBar.dart';
import 'package:movies_app/widgets/movies_items.dart';

import '../components/search_filed_widget.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Constants.kBlackColor,
        extendBody: true,
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: -height * 0.1,
                left: -width * 0.05,
                child: Blur_Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    color: Constants.kGreenColor),
              ),
              Positioned(
                top: height * 0.3,
                right: -width * 0.05,
                child: Blur_Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    color: Constants.kPinkColor),
              ),
              Positioned(
                bottom: -height * 0.1,
                left: -width * 0.05,
                child: Blur_Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    color: Constants.kGreenColor),
              ),
              SafeArea(
                  bottom: false,
                  child: ListView(
                    primary: true,
                    children: [
                      SizedBox(
                        height: height * 0.07,
                      ),
                      Text(
                        'What would you\nlike to watch?',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: Constants.kWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      SearchFieldWidget(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Popular Movies',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                            color: Constants.kWhiteColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Movies_Item(items_list: newMovies),
                      SizedBox(height: height * 0.05),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Upcoming Movies',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                            color: Constants.kWhiteColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Movies_Item(items_list: upcomingMovies),
                      SizedBox(
                        height: height * 0.06,
                      )
                    ],
                  ))
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                gradient: LinearGradient(
                    colors: [
                      Constants.kPinkColor,
                      Constants.kPinkColor.withOpacity(0.5),
                      Constants.kGreenColor.withOpacity(0.8),
                      Constants.kGreenColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.2, 0.4, 0.6, 1]),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 93, 92, 92),
                    borderRadius: BorderRadius.circular(60)),
              ),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: SvgPicture.asset(
                Constants.kIconPlus,
                width: 30,
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const Glassmorphism_btmNavBar());
  }
}
