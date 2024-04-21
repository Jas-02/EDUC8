// ignore_for_file: avoid_print

import 'package:educ8/auth/firebase_auth_services.dart';
import 'package:educ8/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  bool _isRememberMe = true;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _loginPasswordController.dispose();
    _loginEmailController.dispose();
    super.dispose();
  }

  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _signUp() async {
    // Remove the unused variable 'username'
    // String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
   
      print('User is successfully created');
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    } else {
      print('Some error occured while signup');
    }
  }

  void _login() async {
    String email = _loginEmailController.text;
    String password = _loginPasswordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully loggedIn');
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    } else {
      print('Some error occured while login');
    }
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    if (userCredential.user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const HomeScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        color: const Color(0xFF547CAB),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 122.85,
              height: 122.89,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                ),
              ),
              child: Image.asset('assets/images/educlogo.png'),
            ),
            SizedBox(
              height: 60.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              height: MediaQuery.of(context).size.height * 0.65,
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  TabBar(
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: const Color(0xff8F8E8E),
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist'),
                    controller: controller,
                    tabs: const [
                      Tab(
                        text: "Login",
                      ),
                      Tab(
                        text: "Sign up",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        // Your login content here
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 50.h),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffFAFAFA),
                                  ),
                                  child: TextFormField(
                                    controller: _loginEmailController,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff9E9E9E)),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffFAFAFA),
                                  ),
                                  child: TextFormField(
                                    controller: _loginPasswordController,
                                    obscureText: _isHidden,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: _toggleVisibility,
                                        icon: _isHidden
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff9E9E9E)),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 70.w, vertical: 10.h),
                                  child: ListTile(
                                    leading: _isRememberMe
                                        ? const Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Color(0xff9E9E9E),
                                          )
                                        : const Icon(
                                            Icons.check_box_rounded,
                                            color: Colors.green,
                                          ),
                                    title: Text(
                                      'Remember me',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _isRememberMe = !_isRememberMe;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 44.h,
                                  width: 164.w,
                                  child: InkWell(
                                    splashColor: Colors.black,
                                    onTap: _login,
                                    child: Container(
                                      // style: ButtonStyle(),
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFF618BBD),
                                            Color(0xFF7DAFE9)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Log in',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  'Forgot the password ?',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Divider(
                                      thickness: 10.h,
                                    ),
                                    Text(
                                      'OR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp,
                                          color: const Color(0xff616161)),
                                    ),
                                    Divider(
                                      thickness: 10.h,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 88.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          border: Border.all(
                                              color: const Color(0xffEEEEEE))),
                                      child: Image.asset(
                                          'assets/images/facebook.png'),
                                    ),
                                    GestureDetector(
                                      onTap:() async{
                                          signInWithGoogle();
                                      },
                                      child: Container(
                                        height: 60.h,
                                        width: 88.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            border: Border.all(
                                                color:
                                                    const Color(0xffEEEEEE))),
                                        child: Image.asset(
                                            'assets/images/google.png'),
                                      ),
                                    ),
                                    Container(
                                      height: 60.h,
                                      width: 88.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          border: Border.all(
                                              color: const Color(0xffEEEEEE))),
                                      child: Image.asset(
                                          'assets/images/apple.png'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 50.h),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffFAFAFA),
                                  ),
                                  child: TextFormField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                      labelText: "Username",
                                      labelStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff9E9E9E)),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffFAFAFA),
                                  ),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff9E9E9E)),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffFAFAFA),
                                  ),
                                  child: TextFormField(
                                    obscureText: _isHidden,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: _toggleVisibility,
                                        icon: _isHidden
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff9E9E9E)),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  width: 164.w,
                                  child: InkWell(
                                    splashColor: Colors.black,
                                    onTap: _signUp,
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFF618BBD),
                                            Color(0xFF7DAFE9)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xff9E9E9E),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const TextSpan(text: '  '),
                                    TextSpan(
                                      text: 'Sign in',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
