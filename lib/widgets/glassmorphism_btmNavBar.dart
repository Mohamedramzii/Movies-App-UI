import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../constants.dart';

class Glassmorphism_btmNavBar extends StatelessWidget {
  const Glassmorphism_btmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GlassmorphicContainer(
        width: width,
        height: height * 0.1,
        borderRadius: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kWhiteColor.withOpacity(0.1),
              Constants.kWhiteColor.withOpacity(0.1),
            ]),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          elevation: 0,
          notchMargin: 4,
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(height: height * 0.02,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Constants.kIconHome))),
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Constants.kIconPlayOnTv))),
                    const Expanded(child: Text('')),
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Constants.kIconCategories))),
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Constants.kIconDownload))),
                  ]),
            ],
          ),
        ),
      );
  }
}