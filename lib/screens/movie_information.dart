import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/components/masked_image.dart';

import '../constants.dart';
import '../models/movie.dart';

class Movie_Information extends StatelessWidget {
  final Movie? movie;
  const Movie_Information({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var splitted_moviename = movie!.movieName.split(' ');
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Constants.kBlackColor, Colors.black87])),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                width: width,
                height: height * 0.6,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          height: height * 0.55,
                          width: width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(movie!.moviePoster),
                                  fit: BoxFit.fill)),
                        )),
                    Positioned(
                      top: height * 0.06,
                      left: width * 0.03,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: width * 0.15,
                          height: height * 0.06,
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: SvgPicture.asset(Constants.kIconBack),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.06,
                      right: width * 0.03,
                      child: Container(
                        width: width * 0.15,
                        height: height * 0.06,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: SvgPicture.asset(Constants.kIconMenu),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  movie!.movieName,
                  textAlign: TextAlign.center,
                  // splitted_moviename.length.toString(),
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  movie_details(width,
                      text: movie!.movieReleaseYear,
                      icon: Icons.date_range_outlined),
                  movie_details(width,
                      text: movie!.movieCategory, icon: Icons.info),
                  movie_details(width,
                      text: movie!.movieDuration, icon: Icons.timelapse),
                ],
              )),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: RatingBar.builder(
                    itemSize: 20.sp,
                    ignoreGestures: true,
                    unratedColor: Colors.white,
                    initialRating: double.parse(movie!.movieRating),
                    // minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Constants.kYellowColor,
                      );
                    },
                    onRatingUpdate: (rating) => debugPrint(rating.toString())),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie!.movieSinopsis,
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(
                color: Constants.kGreyColor,
                height: height * 0.04,
                endIndent: width * 0.08,
                indent: width * 0.08,
              ),
              Center(
                  child: Text(
                'Cast',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.3,
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: movie!.movieCast.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Text(
                          movie!.movieCast[index],
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: height * 0.02,
                    );
                  },
                ),
              )
            ],
          )),
    );
  }

  Widget movie_details(double width,
      {required IconData icon, required String text}) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
