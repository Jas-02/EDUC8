import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Container(
          margin: EdgeInsets.only(right: 10.w),
          width: double.infinity.w,
          height: 50.h,
          decoration: ShapeDecoration(
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
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse by category',
                style: TextStyle(
                  color: const Color(0xFF0C141C),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.33,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SubTile(title: 'Art'),
                  SubTile(title: 'Business'),
                  SubTile(title: 'Design'),
                  SubTile(title: 'Economics'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Featured Creators',
                style: TextStyle(
                  color: const Color(0xFF0C141C),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.33,
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
                      imageUrl: 'assets/images/katherine.png',
                      name: 'Katherine Smith',
                      description: 'Marketing Lead at Google',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const CreatorTile(
                      imageUrl: 'assets/images/alex.png',
                      name: 'Alex Johnson',
                      description: 'Designer at Facebook',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const CreatorTile(
                      imageUrl: 'assets/images/katherine.png',
                      name: 'Katherine Smith',
                      description: 'Marketing Lead at Google',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const CreatorTile(
                      imageUrl: 'assets/images/alex.png',
                      name: 'Alex Johnson',
                      description: 'Designer at Facebook',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ),
              Text(
                'Lectures',
                style: TextStyle(
                  color: const Color(0xFF0C141C),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.33,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const LectureTile(
                      imageUrl: 'assets/images/team.png',
                      name: 'How to lead a team',
                      description: 'Katherine Smith · 1.3k views',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const LectureTile(
                      imageUrl: 'assets/images/product.png',
                      name: 'Product Design',
                      description: 'Alex Johnson · 2.6k views',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const LectureTile(
                      imageUrl: 'assets/images/team.png',
                      name: 'How to lead a team',
                      description: 'Katherine Smith · 1.3k views',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const LectureTile(
                      imageUrl: 'assets/images/product.png',
                      name: 'Product Design',
                      description: 'Alex Johnson · 2.6k views',
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
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

class SubTile extends StatelessWidget {
  final String title;
  const SubTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFE8EDF4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xFF0C141C),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CreatorTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  const CreatorTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      height: 288.h,
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
            name,
            style: TextStyle(
              color: const Color(0xFF0C141C),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              style: TextStyle(
                color: const Color(0xFF49779B),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
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
  final String description;
  const LectureTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      // height: 288.h,
      width: 166.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // width: 166.w,
            // height: 165.h,
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
              color: const Color(0xFF0C141C),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              style: TextStyle(
                color: const Color(0xFF49779B),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
