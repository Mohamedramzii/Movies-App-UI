// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/components/custom_outline.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/routes/routes.dart';
import 'package:movies_app/widgets/blur_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  bool _isloading = false;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () => _goNext());
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.homeScreen);
  }

  @override
  void initState() {
    super.initState();
    _isloading = true;
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
    _isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
                top: height * 0.01,
                left: -width * 0.2,
                child: Blur_Container(
                    width: width * 0.4,
                    height: height * 0.4,
                    color: Constants.kPinkColor)),
            Positioned(
                top: height * 0.2,
                right: -width * 0.23,
                child: Blur_Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    color: Constants.kGreenColor)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.07,
                  ),
                  CustomOutline(
                    strokeWidth: width * 0.01,
                    radius: width * 0.8,
                    padding: const EdgeInsets.all(4),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kPinkColor,
                        Constants.kPinkColor.withOpacity(0),
                        Constants.kGreenColor.withOpacity(0.1),
                        Constants.kGreenColor,
                      ],
                      stops: const [0.2, 0.4, 0.6, 1],
                    ),
                    width: width * 0.9,
                    height: width * 0.9,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/img-onboarding.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Watch Movies In\n Virtual Reality ',
                    style: TextStyle(
                        fontSize:40.sp,
                        fontWeight: FontWeight.bold,
                        color: Constants.kWhiteColor.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    'Watch whenever you want,\n wherever you want. ',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Constants.kWhiteColor.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  _isloading ? const CircularProgressIndicator(
                    color: Constants.kPinkColor,
                  ) : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
