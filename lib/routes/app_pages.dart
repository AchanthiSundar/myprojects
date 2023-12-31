import 'package:myprojects/bindings/contact_list_binding.dart';
import 'package:myprojects/pages/list_vew.dart';
import 'package:get/get.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const ContactListTask(),
      binding: ContactListBinding(),
    ),
  ];
}
