import 'package:get/route_manager.dart';
import 'package:visual_planner/modules/auth/forgot_password.dart';
import 'package:visual_planner/modules/auth/login.dart';
import 'package:visual_planner/modules/auth/otp_screen.dart';
import 'package:visual_planner/modules/auth/signUp.dart';
import 'package:visual_planner/modules/auth/update_password.dart';
import 'package:visual_planner/modules/dashboard/dashboard.dart';
import 'package:visual_planner/modules/homeScreen/HomeScreen.dart';
import 'package:visual_planner/modules/onBoarding/onBoarding.dart';
import 'package:visual_planner/splash_screen.dart';

import '../modules/auth/phone_number_otp.dart';

class Routes {
  //splash screen
  static const splashScreen = '/splashScreen';
  //onBoardingScreens
  static const onBoardingOne = '/onBoardingOne';
  //homeScreen login, signUp
  static const welcomeScreen = '/welcomeScreen';
  //auth screens
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgotPassword = '/forgotPassword';
  static const otpScreen = '/otpScreen';
  static const phoneotpScreen = '/phoneotpScreen';
  static const updatePassword = '/updatePassword';
  static const successScreen = '/successScreen';
  static const homeScreen = '/homeScreen';
  static const dashboard = '/dashboardScreen';

  static final List<GetPage> getPages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()), //onboarding
    GetPage(name: onBoardingOne, page: () => onBoarding()),
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: signUp, page: () => SignUp()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: forgotPassword, page: () => ForgotPassword()),
    GetPage(name: otpScreen, page: () => const OtpScreen()),
    GetPage(name: phoneotpScreen, page: () => ForgotPasswordPhone()),
    GetPage(name: dashboard, page: () => DashboardScreen()),
    GetPage(name: updatePassword, page: () => UpdatePassword()),
    // GetPage(name: successScreen, page: () => const SuccessScreen()),
    //GetPage(name: homeScreen, page: () => const HomeScreen())
  ];
}
