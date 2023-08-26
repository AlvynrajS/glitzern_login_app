import 'package:get/get.dart';
import 'package:glitzern_login_app/main.dart';
import 'package:glitzern_login_app/screens/dash_board_screen/dash_board_screen.dart';
import 'package:glitzern_login_app/screens/registration_screen/registration_screen.dart';
import 'screens/login_screen/login_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/login_screen', page: () => const LogInScreen()),
    GetPage(name: '/registration_screen', page: () => const RegistrationScreen()),
    GetPage(name: '/dash_board_screen', page: () =>  DashBoardScreen()),
  ];
}
