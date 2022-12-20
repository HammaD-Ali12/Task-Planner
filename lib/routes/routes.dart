import 'package:get/route_manager.dart';
import 'package:visual_planner/modules/auth/forgot_password.dart';
import 'package:visual_planner/modules/auth/login.dart';
import 'package:visual_planner/modules/auth/otp_screen.dart';
import 'package:visual_planner/modules/auth/signUp.dart';
import 'package:visual_planner/modules/auth/success_screen.dart';
import 'package:visual_planner/modules/auth/update_password.dart';
import 'package:visual_planner/modules/homeScreen/HomeScreen.dart';
import 'package:visual_planner/modules/onBoarding/onBoarding.dart';
import 'package:visual_planner/splash_screen.dart';

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
  static const updatePassword = '/updatePassword';
  static const successScreen = '/successScreen';
  static const homeScreen = '/homeScreen';

  static final List<GetPage> getPages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()), //onboarding
    GetPage(name: onBoardingOne, page: () => onBoarding()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: signUp, page: () => SignUp()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: forgotPassword, page: () => ForgotPassword()),
    // GetPage(name: otpScreen, page: () => const OtpScreen()),
    // GetPage(name: updatePassword, page: () => UpdatePassword()),
    // GetPage(name: successScreen, page: () => const SuccessScreen()),
    // GetPage(name: homeScreen, page: () => const HomeScreen())
  ];
}
