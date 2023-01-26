import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, required this.padding}) : super(key: key);
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
             SizedBox(
              width: 8.w,
            ),
            SvgPicture.asset(
              Constants.kIconSearch,
            ),
              SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    fontSize: 17.sp,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset(Constants.kIconMic),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
