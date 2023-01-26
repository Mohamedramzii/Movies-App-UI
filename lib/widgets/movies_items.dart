import 'package:flutter/material.dart';
import 'package:movies_app/routes/routes.dart';
import 'package:movies_app/screens/movie_information.dart';

import '../components/masked_image.dart';
import '../constants.dart';
import '../models/movie.dart';

class Movies_Item extends StatelessWidget {
  final List<Movie> items_list;
  const Movies_Item({
    Key? key,
    required this.items_list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.28,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        primary: true,
        itemCount: items_list.length,
        itemBuilder: (context, index) {
          String mask;
          index == 0
              ? mask = Constants.kMaskFirstIndex
              : index == newMovies.length - 1
                  ? mask = Constants.kMaskLastIndex
                  : mask = Constants.kMaskCenter;
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Movie_Information(
                        movie: items_list[index],
                      )));
            },
            child: Container(
              // color: Colors.transparent,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              // height: 160,
              width: width * 0.5,
              child:
                  MaskedImage(asset: items_list[index].moviePoster, mask: mask),
            ),
          );
        },
      ),
    );
  }
}
