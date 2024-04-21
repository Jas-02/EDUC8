import 'package:educ8/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE8EDF4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.68),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Search for lectures, creators',
                      hintStyle: TextStyle(
                        color: const Color(0xFF547CAB),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      filled: true,
                      fillColor: const Color(0xffF8F8F8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFF547CAB),
                        size: 20.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const CreatorTile(
                      imageUrl: 'assets/images/chemistry.png',
                      title: 'Chemistry'),
                  SizedBox(
                    width: 20.w,
                  ),
                  const CreatorTile(
                      imageUrl: 'assets/images/maths.png',
                      title: 'Mathematics'),
                  SizedBox(
                    width: 20.w,
                  ),
                  const CreatorTile(
                      imageUrl: 'assets/images/chemistry.png',
                      title: 'Chemistry'),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Featured Creators',
                style: TextStyle(
                  color: const Color(0xFF0C141C),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.33,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const LectureTile(
                imageUrl: 'assets/images/andrew.png',
                name: 'Professor Andrew Ng',
                text1: 'Stanford University',
                text2: '5 lectures',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const LectureTile(
                imageUrl: 'assets/images/robert.png',
                name: 'Professor Robert Sapolsky',
                text1: 'Stanford University',
                text2: '7 lectures',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'New to our platform',
                style: TextStyle(
                  color: const Color(0xFF0C141C),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.33,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Center(
              child: PlatformTile(
                imageUrl: 'assets/images/science.png',
                title: 'The science of well-being',
                title1: 'Yale University',
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const Center(
              child: PlatformTile(
                imageUrl: 'assets/images/modern.png',
                title: 'Modern and contemporary art',
                title1: 'University of Illinois',
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
              
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  const LoginScreen();
                  }));
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF2193DD),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Center(
                  child: Text(
                    'Sign up to start learning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CreatorTile extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CreatorTile({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      height: 250.h,
      width: 166.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 166.w,
            height: 165.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Image.asset(imageUrl),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF0C141C),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class LectureTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String text1;
  final String text2;
  const LectureTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      // height: 288.h,
      // width: 166.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 358.w,
            height: 202.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Image.asset(imageUrl),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            name,
            style: TextStyle(
              color: const Color(0xFF111416),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.27,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      color: const Color(0xFF637787),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                      color: const Color(0xFF637787),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    height: 32.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFF2193DD),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PlatformTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String title1;
  const PlatformTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.title1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: 358.w,
      height: 125.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F9FC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF0C141C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  title1,
                  style: TextStyle(
                    color: const Color(0xFF49779B),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                height: 32.h,
                decoration: BoxDecoration(
                    color: const Color(0xFFE8EDF4),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: Text(
                    'Start watching',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 103.w,
                height: 93.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Image.asset(imageUrl),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
