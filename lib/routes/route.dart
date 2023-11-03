import 'package:get/get.dart';

import '../views/login_view.dart';
import '../views/home_view.dart';
import '../views/room_view.dart';
import '../views/signup_view.dart';

final appRoutes = [
  GetPage(
    name: '/login',
    page: () => const LoginView(),
  ),
  GetPage(
    name: '/signup',
    page: () => const SignupView(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
  ),
  GetPage(
    name: '/room',
    page: () => const RoomView(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 250),
  ),
];
