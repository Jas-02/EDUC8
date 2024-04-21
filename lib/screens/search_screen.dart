import 'package:educ8/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180.w,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFF547CAB), Color(0xFF8BC1FF)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 180.w,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFF547CAB), Color(0xFF8BC1FF)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'Services',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'Product Designer',
                name: 'by  Raunak Jha',
                imageUrl: 'assets/images/raunak1.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'Web Designer',
                name: 'by  Sumit Kawade',
                imageUrl: 'assets/images/sumit.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'Social Media',
                name: 'by  Sourabh Patil',
                imageUrl: 'assets/images/sourabh.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'App Development',
                name: 'by Jeffry Bezos',
                imageUrl: 'assets/images/jeffry.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'Product Designer',
                name: 'by  Raunak Jha',
                imageUrl: 'assets/images/raunak1.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'Web Designer',
                name: 'by  Sumit Kawade',
                imageUrl: 'assets/images/sumit.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'Social Media',
                name: 'by  Sourabh Patil',
                imageUrl: 'assets/images/sourabh.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const SearchTile(
                title: 'App Development',
                name: 'by Jeffry Bezos',
                imageUrl: 'assets/images/jeffry.png',
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String title;
  final String name;
  final String imageUrl;

  const SearchTile(
      {super.key,
      required this.title,
      required this.name,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376.w,
      height: 138.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFB8B8B8),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 139.w,
            height: 138.h,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFB8B8B8),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            child: Image.asset(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF547CAB),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // SizedBox(
                //   height: 5.h,
                // ),
                Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xFF547CAB),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'i have an experience of 3+ yearsin \nui ux & have completed 100+ projects',
                  maxLines: 3,
                  style: TextStyle(
                    color: const Color(0xFFA3A3A3),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'view profile >',
                      style: TextStyle(
                        color: const Color(0xFF547CAB),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      '5+ Rating',
                      style: TextStyle(
                        color: const Color(0xFF547CAB),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
