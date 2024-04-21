import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with SingleTickerProviderStateMixin {
  @override
  late TabController controller;
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title: Text(
          'Projects',
          style: TextStyle(
            color: const Color(0xFF111416),
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.27,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 24.h,
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              indicatorColor: const Color(0xFFEFF2F4),
              dividerColor: Colors.transparent,
              unselectedLabelColor: const Color(0xff8F8E8E),
              labelStyle: TextStyle(
                color: const Color(0xFF111416),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                // letterSpacing: 0.21,
              ),
              controller: controller,
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Open",
                ),
                Tab(
                  text: "My project",
                ),
                Tab(
                  text: "Saved",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.h,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFEFF2F4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Icon(Icons.add_circle_outline_rounded),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Post a project',
                                    style: TextStyle(
                                      color: const Color(0xFF111416),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Share your project and get it done',
                                    style: TextStyle(
                                      color: const Color(0xFF637787),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const ProjectTile(
                            imageUrl: 'assets/images/design.png',
                            name: 'Design a logo for my new company',
                            text1: 'Up to \$500',
                            text2: '3 days left',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const ProjectTile(
                            imageUrl: 'assets/images/website.png',
                            name: 'I need a website built for my business',
                            text1: 'Up to \$750',
                            text2: '5 days left',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const ProjectTile(
                            imageUrl: 'assets/images/design.png',
                            name: 'Design a logo for my new company',
                            text1: 'Up to \$500',
                            text2: '3 days left',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String text1;
  final String text2;
  const ProjectTile(
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
                        'View Project',
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
