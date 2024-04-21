import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educ8/screens/camera_screen.dart';
import 'package:educ8/screens/categories_screen.dart';
import 'package:educ8/screens/courses_screen.dart';
import 'package:educ8/screens/lecture_screen.dart';
import 'package:educ8/screens/post_screen.dart';
import 'package:educ8/screens/profile_screen.dart';
import 'package:educ8/screens/projects_screen.dart';
import 'package:educ8/screens/search_screen.dart';
import 'package:educ8/screens/upload_photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final List<Widget> _children = [
    // This is incorrect, you should add instances of different screens here

    const PostScreen(),
    const SearchScreen(),
    PickImage(),
    const CoursesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: _currentIndex !=
                  4 // Check if the current index is not 4 (ProfileScreen)
              ? AppBar(
                  centerTitle: true,
                  title: Container(
                    width: 230.w,
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
                          hintText: 'search',
                          hintStyle: TextStyle(
                            color: const Color(0xFF547CAB),
                            fontSize: 19.sp,
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
                  leading: IconButton(
                    icon: const Icon(
                      Icons.menu, // Changed to menu icon for drawer
                      color: Color(0xFF547CAB),
                    ),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  // actions: const [
                  //   Icon(
                  //     Icons.message_rounded,
                  //     color: Color(0xFF547CAB),
                  //   ),
                  //   SizedBox(
                  //     width: 10,
                  //   )
                  // ],
                )
              : null,
          body: _children[_currentIndex],
          drawer: Drawer(
            width: 271.w,
            backgroundColor: const Color(0xFF547CAB),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22.5.r,
                        child: Image.asset('assets/images/raunak.png'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Raunak Jha',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProfileScreen();
                              }));
                            },
                            child: Text(
                              'view profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.80, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ProjectsScreen();
                      }));
                    },
                    leading: const Text(
                      'Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.80, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CategoriesScreen();
                      }));
                    },
                    leading: const Text(
                      'Services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.80, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LectureScreen();
                      }));
                    },
                    leading: const Text(
                      'Lectures',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.80, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.80, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 35.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
              index: _currentIndex,
              height: 70.h,
              buttonBackgroundColor: const Color(0xFF547CAB),
              color: const Color(0xFF547CAB),
              backgroundColor: Colors.transparent,
              items: const [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ],
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              })),
    );
  }
}
